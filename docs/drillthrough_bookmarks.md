# Drill-Through, Bookmarks, and Navigation

## Drill-Through Pages

### Country Detail

Drill-through field:

- `Dim Country[Country]`

Includes:

- Country KPI strip
- EV sales and stock trend
- YoY growth
- CAGR
- BEV/PHEV mix
- Charging coverage
- Infrastructure gap

### Manufacturer Detail

Drill-through field:

- `Dim Manufacturer[Manufacturer]`

Includes:

- Manufacturer rank
- Market share
- Revenue contribution
- Model mix
- Average price
- Electric range distribution

### Battery Technology Detail

Drill-through field:

- `Dim Vehicle[Battery Technology]`

Includes:

- Battery technology comparison
- Average range
- Average price
- Model count
- Adoption by model year

### Charging Infrastructure Detail

Drill-through field:

- `Dim Country[Country]`

Includes:

- Charging point trend
- Fast vs slow charging split
- Coverage per 1,000 EVs
- Charging readiness score

## Bookmarks

Create the following report bookmarks:

- `BM_Executive_Summary`
- `BM_Growth_Lens`
- `BM_Manufacturer_Lens`
- `BM_Infrastructure_Lens`
- `BM_Forecast_Lens`
- `BM_Reset_Filters`

## Navigation Buttons

Top navigation:

- Executive Overview
- Growth
- Manufacturers
- Battery Tech
- Charging
- Forecast

Utility buttons:

- Reset filters
- Back
- Drill-through return
- Show definitions
- Hide definitions

## Professional Polish Checklist

- Use consistent button sizing.
- Use selected-state accent color.
- Disable unnecessary visual headers.
- Add tooltip pages for complex KPIs.
- Keep slicers aligned and visually quiet.
- Use bookmarks for lens-based storytelling rather than duplicating pages unnecessarily.
