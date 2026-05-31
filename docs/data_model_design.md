# Data Model Design

## Modeling Approach

The Power BI model should use a star schema. Fact tables store numeric activity such as sales, stock, charging points, forecasts, and vehicle registration counts. Dimension tables store descriptive attributes such as date, country, manufacturer, vehicle, powertrain, and scenario.

## Fact Tables

### Fact EV Sales

Grain: one row per year, country, powertrain, scenario, and vehicle mode.

Columns:

- DateKey
- CountryKey
- PowertrainKey
- ScenarioKey
- VehicleMode
- EV Sales
- Unit

### Fact EV Stock

Grain: one row per year, country, powertrain, scenario, and vehicle mode.

Columns:

- DateKey
- CountryKey
- PowertrainKey
- ScenarioKey
- EV Stock
- Unit

### Fact Charging Infrastructure

Grain: one row per year, country, charging speed, and charger type.

Columns:

- DateKey
- CountryKey
- Charging Speed
- Charging Points
- Unit

### Fact Vehicle Registrations

Grain: one row per registered EV.

Columns:

- DOL Vehicle ID
- VIN Prefix
- DateKey or ModelYearKey
- CountryKey
- ManufacturerKey
- VehicleKey
- PowertrainKey
- County
- City
- Postal Code
- Electric Range
- Base MSRP
- Vehicle Count

### Fact EV Forecast

Grain: one row per future year, country, powertrain, and scenario.

Columns:

- DateKey
- CountryKey
- PowertrainKey
- ScenarioKey
- Forecast EV Sales
- Forecast EV Stock

## Dimension Tables

### Dim Date

- DateKey
- Date
- Year
- Quarter
- Month
- Month Number

### Dim Country

- CountryKey
- Country
- Region
- ISO Alpha-2
- ISO Alpha-3
- Latitude
- Longitude

### Dim Manufacturer

- ManufacturerKey
- Manufacturer
- Parent Group
- Headquarters Country
- Strategic Segment

### Dim Vehicle

- VehicleKey
- ManufacturerKey
- Model
- Model Year
- Average Price
- Electric Range
- Battery Technology
- Vehicle Class

### Dim Powertrain

- PowertrainKey
- Powertrain
- Powertrain Description

### Dim Scenario

- ScenarioKey
- Scenario
- Scenario Description

## Relationship Design

- `Dim Date[DateKey]` one-to-many into all fact tables.
- `Dim Country[CountryKey]` one-to-many into global sales, stock, charging, and forecast facts.
- `Dim Manufacturer[ManufacturerKey]` one-to-many into vehicle and registration facts.
- `Dim Vehicle[VehicleKey]` one-to-many into registration facts.
- `Dim Powertrain[PowertrainKey]` one-to-many into all EV market facts.
- `Dim Scenario[ScenarioKey]` one-to-many into forecast and IEA scenario fact tables.

## Modeling Notes

- Keep all relationships single-direction from dimensions to facts.
- Hide surrogate keys from report view.
- Create a dedicated measures table named `_Measures`.
- Use `Dim Date` as the official date table.
- Avoid many-to-many relationships unless a bridge table is required for manufacturer parent groups.
