# GitHub Push Checklist

## Ready to Push Now

These files are ready for GitHub:

- `README.md`
- `assets/dashboard-preview.svg`
- `docs/build_steps.md`
- `docs/dashboard_layout_plan.md`
- `docs/data_model_design.md`
- `docs/dataset_profile.md`
- `docs/drillthrough_bookmarks.md`
- `powerbi/DAX_Measures.dax`
- `powerbi/Power_Query_Transformations.pq`
- `powerbi/EV_Dark_Executive_Theme.json`
- `.gitignore`

## Add Before Final Recruiter Version

Save the finished report from Power BI Desktop:

```text
powerbi/Global_EV_Market_Intelligence_Dashboard.pbix
```

Export final dashboard screenshots:

```text
assets/screenshots/01_executive_overview.png
assets/screenshots/02_market_growth.png
assets/screenshots/03_manufacturer_detail.png
assets/screenshots/04_charging_infrastructure.png
assets/screenshots/05_forecast_analysis.png
```

## Do Not Push Large Raw Data

The project `.gitignore` excludes:

```text
data/raw/
data/processed/
```

This keeps GitHub clean and avoids uploading large source datasets. The README and `data/README.md` include dataset download links so recruiters can reproduce the project.

## Recommended GitHub Repository Name

```text
global-ev-market-intelligence-dashboard
```

## Recommended Description

```text
Executive Power BI dashboard analyzing global EV adoption, manufacturer market share, charging infrastructure, and forecast trends using IEA and 285k+ EV registration records.
```

## Recommended Topics

```text
power-bi
dax
power-query
data-analytics
business-intelligence
ev-market
dashboard
data-visualization
portfolio-project
```
