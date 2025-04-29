# City Statistics - OECD FUA Analysis

**City Statistics - OECD FUA Analysis** is a data analysis project focused on the economic, demographic, and environmental characteristics of Functional Urban Areas (FUA) across OECD countries.

The project uses advanced R scripting to clean, analyze, and visualize real-world datasets, addressing important research questions about GDP, labor markets, pollution, and urban development.

---

## 🌐 Project Overview

- Preprocessing, cleaning, and integration of OECD's City Statistics datasets.
- Exploratory Data Analysis (EDA) with statistical graphics and heatmaps.
- In-depth analysis of:
  - Correlation between GDP per capita and PM2.5 pollution.
  - Impact of labor force, unemployment, and population on GDP per capita.
  - Temporal evolution of GDP.
  - Clustering of countries based on socio-economic and environmental indicators.
  - Trends in air quality (PM2.5 exposure) from 2009 to 2019.
- Fully reproducible R environment using `renv`.

---

## 🛠️ Technologies & Tools

- **Programming Language**: R
- **Environment Management**: renv
- **Data Analysis & Visualization**: tidyverse, ggplot2, dplyr, tidyr, cluster, factoextra
- **Document Preparation**: RMarkdown, LaTeX (for PDF report generation)

---

## 📁 Repository Structure

```plaintext
City-Statistics-Analysis/
├── docs/                    → Project documentation and presentations
├── dataset/                 → Raw, cleaned, and temporary datasets
├── misurazioni/             → Measurement results (e.g., distance matrices)
├── script/                  → R scripts organized by task
├── renv/                    → Environment management folder
├── .Rprofile                → Project-specific R profile settings
├── CityStatistics.Rproj     → RStudio project file
├── renv.lock                → Locked package versions for reproducibility
├── percentuale_media_per_citta_variabili_con_NA.csv  → Imputation statistics
├── README.md                → This file
```

---

## 🚀 How to Use

1. Open the project with `CityStatistics.Rproj` in RStudio.
2. Restore the project environment by running `renv::restore()`.
3. Explore the scripts inside `script/`:
   - `EDA/` for exploratory data analysis.
   - `Research_Questions/` for scripts answering each research question.
   - `Clustering/` and `PM25_Analysis/` for advanced studies.
4. Review the documentation inside `docs/` for detailed methodology and results.

---

## 📅 Research Questions Addressed

1. Is there a correlation between GDP per capita and mean PM2.5 exposure?
2. How do labor force, unemployment, and population jointly impact GDP per capita?
3. How has GDP evolved over time across cities?
4. Can countries be grouped into clusters based on socio-economic and environmental indicators?
5. How has PM2.5 exposure changed between 2009 and 2019?

---

## 📄 Documentation

- [City Statistics Final Report (PDF)](docs/Relazione_City_Statistics.pdf)
- [Project Presentation (PPTX)](docs/Presentazione_City_Statistics.pptx)

---

## 👥 Contributors

- Marco Di Maio
- Pasquale Somma

---

## ✨ Notes

This project was developed for the Applied Statistics course at the University of Salerno, emphasizing real-world data wrangling, time series analysis, clustering, and exploratory research.

For any questions or feedback, feel free to reach out!
