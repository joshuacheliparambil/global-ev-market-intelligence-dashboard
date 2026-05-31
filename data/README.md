# Data Folder

Source files belong in this folder before connecting Power BI.

## Already Downloaded

The following files have been downloaded into `data/raw`:

```text
data/raw/
|-- Washington_EV_Population_Data.csv
|-- OWID_Electric_Car_Sales.csv
|-- OWID_Electric_Car_Sales_Share.csv
|-- OWID_Electric_Car_Stocks.csv
|-- OWID_Share_Car_Stocks_Electric.csv
`-- OWID_BEV_Share_New_EV.csv
```

`Washington_EV_Population_Data.csv` contains roughly 285,000 EV registration rows, which satisfies the 50,000+ record requirement.

The OWID files are open CSV datasets processed by Our World in Data from the International Energy Agency Global EV Outlook data. They can be used immediately for global EV sales, sales share, stock, stock share, and BEV share analysis.

## Recommended Structure

```text
data/
|-- raw/
|   |-- IEA_Global_EV_Data_2026.xlsx
|   |-- Washington_EV_Population_Data.csv
|   |-- OWID_Electric_Car_Sales.csv
|   |-- OWID_Electric_Car_Sales_Share.csv
|   |-- OWID_Electric_Car_Stocks.csv
|   |-- OWID_Share_Car_Stocks_Electric.csv
|   `-- OWID_BEV_Share_New_EV.csv
|-- lookup/
|   |-- country_region_mapping.csv
|   |-- manufacturer_parent_groups.csv
|   `-- battery_technology_lookup.csv
`-- processed/
```

## Sources

- IEA Global EV Data Explorer: https://www.iea.org/data-and-statistics/data-tools/global-ev-data-explorer
- Washington State EV Population Data: https://data.wa.gov/Transportation/Electric-Vehicle-Population-Data/f6w7-q2d2
- Our World in Data EV charts: https://ourworldindata.org/grapher/electric-car-sales

## IEA Download Note

The official IEA `Global EV Outlook 2026 data set` is free, but the IEA website requires a browser login/session for the Excel download. Automated command-line download is blocked by the site's JavaScript/cookie protection.

If you download it manually from IEA, place it here:

```text
data/raw/IEA_Global_EV_Data_2026.xlsx
```

## Notes

- Keep raw files unchanged.
- Perform cleaning in Power Query.
- Save reusable lookup tables in `data/lookup`.
- Export curated tables to `data/processed` only when needed for documentation or validation.
