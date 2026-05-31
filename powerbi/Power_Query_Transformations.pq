// Global EV Market Intelligence Dashboard
// Power Query transformation blueprint.
// Replace file paths with local CSV locations after downloading source datasets.

let
    Source = Csv.Document(
        File.Contents("data/raw/IEA_Global_EV_Data.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    TrimmedText = Table.TransformColumns(
        PromotedHeaders,
        List.Transform(
            Table.ColumnNames(PromotedHeaders),
            each {_, each if _ is text then Text.Trim(_) else _, type any}
        )
    ),
    StandardizedColumns = Table.RenameColumns(
        TrimmedText,
        {
            {"region", "Country"},
            {"category", "Category"},
            {"parameter", "Metric"},
            {"mode", "Vehicle Mode"},
            {"powertrain", "Powertrain"},
            {"year", "Year"},
            {"unit", "Unit"},
            {"value", "Value"}
        },
        MissingField.Ignore
    ),
    TypedColumns = Table.TransformColumnTypes(
        StandardizedColumns,
        {
            {"Country", type text},
            {"Category", type text},
            {"Metric", type text},
            {"Vehicle Mode", type text},
            {"Powertrain", type text},
            {"Year", Int64.Type},
            {"Unit", type text},
            {"Value", type number}
        }
    ),
    CleanPowertrain = Table.ReplaceValue(TypedColumns, "EV", "All EV", Replacer.ReplaceText, {"Powertrain"}),
    CountryNormalized = Table.TransformColumns(CleanPowertrain, {{"Country", Text.Proper, type text}}),
    AddedDate = Table.AddColumn(CountryNormalized, "Date", each #date([Year], 1, 1), type date),
    FilterCars = Table.SelectRows(AddedDate, each [Vehicle Mode] = "Cars" or [Vehicle Mode] = null),
    RemoveInvalidValues = Table.SelectRows(FilterCars, each [Value] <> null and [Value] >= 0)
in
    RemoveInvalidValues

// Query: EV Registration Records
let
    Source = Csv.Document(
        File.Contents("data/raw/Washington_EV_Population_Data.csv"),
        [Delimiter = ",", Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    TypedColumns = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"VIN (1-10)", type text},
            {"County", type text},
            {"City", type text},
            {"State", type text},
            {"Postal Code", type text},
            {"Model Year", Int64.Type},
            {"Make", type text},
            {"Model", type text},
            {"Electric Vehicle Type", type text},
            {"Clean Alternative Fuel Vehicle (CAFV) Eligibility", type text},
            {"Electric Range", Int64.Type},
            {"Base MSRP", type number},
            {"Legislative District", Int64.Type},
            {"DOL Vehicle ID", type text},
            {"Vehicle Location", type text},
            {"Electric Utility", type text},
            {"2020 Census Tract", type text}
        }
    ),
    TrimmedText = Table.TransformColumns(
        TypedColumns,
        {
            {"Make", each Text.Upper(Text.Trim(_)), type text},
            {"Model", each Text.Upper(Text.Trim(_)), type text},
            {"City", each Text.Proper(Text.Trim(_)), type text},
            {"County", each Text.Proper(Text.Trim(_)), type text}
        }
    ),
    RemoveDuplicates = Table.Distinct(TrimmedText, {"DOL Vehicle ID"}),
    PowertrainClass = Table.AddColumn(
        RemoveDuplicates,
        "Powertrain",
        each if Text.Contains([Electric Vehicle Type], "Battery") then "BEV"
             else if Text.Contains([Electric Vehicle Type], "Plug-in") then "PHEV"
             else "Other",
        type text
    ),
    MSRPNullAsBlank = Table.ReplaceValue(PowertrainClass, 0, null, Replacer.ReplaceValue, {"Base MSRP"}),
    RangeNullAsBlank = Table.ReplaceValue(MSRPNullAsBlank, 0, null, Replacer.ReplaceValue, {"Electric Range"}),
    AddedCountry = Table.AddColumn(RangeNullAsBlank, "Country", each "United States", type text),
    AddedRegistrationCount = Table.AddColumn(AddedCountry, "Vehicle Count", each 1, Int64.Type)
in
    AddedRegistrationCount

// Query: Dim Date
let
    StartDate = #date(2010, 1, 1),
    EndDate = #date(2030, 12, 31),
    DayCount = Duration.Days(EndDate - StartDate) + 1,
    Dates = List.Dates(StartDate, DayCount, #duration(1, 0, 0, 0)),
    TableFromList = Table.FromList(Dates, Splitter.SplitByNothing(), {"Date"}),
    TypedDate = Table.TransformColumnTypes(TableFromList, {{"Date", type date}}),
    AddedYear = Table.AddColumn(TypedDate, "Year", each Date.Year([Date]), Int64.Type),
    AddedQuarter = Table.AddColumn(AddedYear, "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddedMonth = Table.AddColumn(AddedQuarter, "Month", each Date.MonthName([Date]), type text),
    AddedMonthNumber = Table.AddColumn(AddedMonth, "Month Number", each Date.Month([Date]), Int64.Type)
in
    AddedMonthNumber
