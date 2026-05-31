# Power BI Build Steps

## 1. Download Source Data

Create this folder structure:

```text
data/
└── raw/
    ├── IEA_Global_EV_Data.csv
    └── Washington_EV_Population_Data.csv
```

Download the source files:

- IEA Global EV Data Explorer CSV
- Washington State Electric Vehicle Population Data CSV

## 2. Load Data into Power BI

In Power BI Desktop:

1. Select `Get Data`.
2. Choose `Text/CSV`.
3. Load both raw CSV files.
4. Open Power Query.
5. Apply the transformations from `powerbi/Power_Query_Transformations.pq`.

## 3. Build Model Tables

Create or shape these tables:

- `Fact EV Sales`
- `Fact EV Stock`
- `Fact Charging Infrastructure`
- `Fact Vehicle Registrations`
- `Fact EV Forecast`
- `Dim Date`
- `Dim Country`
- `Dim Manufacturer`
- `Dim Vehicle`
- `Dim Powertrain`
- `Dim Scenario`

## 4. Configure Relationships

Use single-direction relationships from dimension tables into fact tables.

Recommended settings:

- Cardinality: one-to-many
- Cross-filter direction: single
- Date table: mark `Dim Date` as the official date table

## 5. Add DAX Measures

Create a blank table named `_Measures`, then add the measures from:

```text
powerbi/DAX_Measures.dax
```

Format measures:

- Percent measures as percentage with 1 decimal place.
- Currency measures as USD or selected reporting currency.
- Unit measures with thousands or millions display formatting.

## 6. Build Dashboard Pages

Build these pages:

- Executive Overview
- Market Growth Intelligence
- Manufacturer & Model Performance
- Battery & Vehicle Technology
- Charging Infrastructure
- Forecasting & Scenario Analysis

Use `docs/dashboard_layout_plan.md` as the page-by-page blueprint.

## 7. Add Drill-Through

Create drill-through pages for:

- Country Detail
- Manufacturer Detail
- Battery Technology Detail
- Charging Infrastructure Detail

Use `docs/drillthrough_bookmarks.md` for configuration.

## 8. Add Bookmarks and Navigation

Create bookmark states for:

- Executive Summary
- Growth Lens
- Manufacturer Lens
- Infrastructure Lens
- Forecast Lens
- Reset Filters

Add page navigation buttons to the top of every report page.

## 9. Export Screenshots

Export final dashboard screenshots to:

```text
assets/screenshots/
```

Recommended names:

- `01_executive_overview.png`
- `02_market_growth.png`
- `03_manufacturer_detail.png`
- `04_charging_infrastructure.png`
- `05_forecast_analysis.png`

## 10. Final Portfolio Polish

Before publishing to GitHub:

- Confirm every visual has a business purpose.
- Confirm cards match the KPI definitions in the README.
- Confirm drill-through works from country and manufacturer visuals.
- Confirm reset filters bookmark works.
- Confirm screenshots are visible in the README.
- Add the finished `.pbix` file to the `powerbi` folder if GitHub file size limits allow it.
