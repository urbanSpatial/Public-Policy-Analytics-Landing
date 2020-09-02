# Public Policy Analytics

[Public Policy Analytics](https://urbanspatial.github.io/PublicPolicyAnalytics/) is a new book by [Ken Steif, Ph.D](https://twitter.com/KenSteif) that teaches at the intersection of data science and public policy. The book is available [online](https://urbanspatial.github.io/PublicPolicyAnalytics/) and eventually, in print. Designed for students studying City Planning and related disciplines, the book teaches both code and context toward improved public-sector decision making. Readers can expect an introduction to R, geospatial data science, and machine learning, conveyed through real world use cases of data science in government.

All of the book's data is free and open source, compiled from across the web. Each chapter includes API calls that read data directly into R. However, for posterity, the [DATA](https://github.com/urbanSpatial/Public-Policy-Analytics-Landing/tree/master/DATA) folder on this repo has all the data, organized by chapter. The sections below provide a description of each dataset and the original source, when applicable. 

### Chapter 1: Indicators for Transit Oriented Development

Following the Introduction, Chapter 1 introduces indicators as an important tool for simplifying and communicating complex processes to non-technical decision makers. Introducing the `tidyverse`, `tidycensus`, and `sf` packages, this chapter analyzes whether Philadelphia renters are willing to pay a premium for transit amenities.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| SEPTA_Broad | Stations on the Broad Street line | http://septaopendata-septa.opendata.arcgis.com/datasets/septa-broad-street-line-stations | geojson | DATA/Chapter1/Stations |
| SEPTA_El | Stations on the Market Frankford (El) line | http://septaopendata-septa.opendata.arcgis.com/datasets/septa-market-frankford-line-stations | geojson | DATA/Chapter1/Stations |

### Chapter 2: Expanding the Urban Growth Boundary

Chapter 2 explores the discontinuous nature of boundaries to understand how an Urban Growth Area in Lancaster County, PA affects suburban sprawl. 

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| studyAreaTowns | Towns inside of the Lancaster County study area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1267 | shapefile | DATA/Chapter2/studyAreaTowns |
| Urban_Growth_Boundary | Lancaster County's Urban Growth Area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1274 | shapefile | DATA/Chapter2/UGB |
| LancasterCountyBuildings | Footprints for all buildings in the study area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1257 | shapefile | DATA/Chapter2/LancasterCountyBuildings |
| LancasterCountyBoundary | Spatial extent of Lancaster County | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1260 | shapefile | DATA/Chapter2/LancasterCountyBoundary |
| LancasterGreenSpace | Non-developed land cover in the study area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=3154 | shapefile | DATA/Chapter2/LancasterCountyGreenSpace |

### Chapters 3 & 4: Intro to Geospatial Machine Learning

Chapters 3 and 4 provide a first look at geospatial predictive modeling, forecasting home prices in Boston, MA. Chapter 3 introduces linear regression, goodness of fit metrics, and cross-validation, with the goal of assessing model accuracy and generalizability. Chapter 4 builds on the initial analysis to account for the 'spatial process' or pattern of home prices.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| Boston_Nhoods | Neighborhoods in Boston, MA | https://data.boston.gov/dataset/boston-neighborhoods | shapefile | DATA/Chapter3_4/Boston_Nhoods |
| bostonHousePriceData_clean | Sale price and housing characteristics of homes sold in Boston between August 2015 and August 2016 | https://data.boston.gov/dataset/property-assessment | csv | DATA/Chapter3_4 |
| bostonCrimes | Crimes in Boston that occurred between August 2015 and August 2016 | https://data.boston.gov/dataset/crime-incident-reports-august-2015-to-date-source-new-system | csv | DATA/Chapter3_4 |
| boston_sf_Ch1_wrangled | All data wrangled in Chapter 3 that can be used in Chapter 4 if analysis is not completed all at once |  | geojson | DATA/Chapter3_4

### Chapter 5: Geospatial Risk Modeling - Predictive Policing

Chapter 5 tackles the controversial topic of Predictive Policing, forecasting burglary risk in Chicago. The argument is made that converting Broken Windows theory into Broken Window policing, can bake bias directly into a predictive model and lead to a discriminatory resource allocation tool. The concept of generalizability remains key.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| chicagoBoundary | Boundary of Chicago, IL | https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-City/ewy2-6yfk | shapefile | DATA/Chapter5/Chicago_Boundary |
| Chicago_Neighborhoods | Neighborhoods in the City of Chicago | https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Neighborhoods/bbvz-uum9 | shapefile | DATA/Chapter5/Chicago_Neighborhoods |
| Police_Districts | Chicago police districts | https://data.cityofchicago.org/Public-Safety/Boundaries-Police-Districts/4dt9-88ua | shapefile | DATA/Chapter5/Police_Districts |
| Police_Beats | Chicago police beats | https://data.cityofchicago.org/Public-Safety/Boundaries-Police-Beats-current-/aerh-rz74 | shapefile | DATA/Chapter5/Police_Beats |
| abandoned_buildings | 311 complaints about abandoned buildings in 2017 | https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Vacant-and-Abandoned-Building/7nii-7srd | shapefile | DATA/Chapter5/abandoned_buildings
| abandoned_cars | 311 calls on abandoned vehicles in 2017 | https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Abandoned-Vehicles/3c9v-pnva | shapefile | DATA/Chapter5/abandoned_cars
| graffiti | 311 calls reporting graffiti in 2017 | https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Graffiti-Removal-Historical/hec5-y4x5 | shapefile | DATA/Chapter5/graffiti
| liquor_retail | Locations of businesses where liquor is sold | https://data.cityofchicago.org/Community-Economic-Development/Business-Licenses-Current-Liquor-and-Public-Places/nrmj-3kcf | shapefile | DATA/Chapter5/liquor_retail
| sanitation | Sanitation code complaints made to 311 in 2017 |https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Sanitation-Code-Complaints-Hi/me59-5fac | shapefile | DATA/Chapter5/sanitation
| street_light_outages | 311 calls reporting street light outages in 2017 | https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Street-Lights-All-Out-Histori/zuxi-7xem | shapfile | DATA/Chapter5/
| burglaries17 | Burglaries that occurred in Chicago in 2017 | https://data.cityofchicago.org/Public-Safety/Crimes-2017/d62x-nvdr | shapefile | DATA/Chapter5/burglaries17
| burglaries18 | Burglaries that occurred in Chicago in 2018 | https://data.cityofchicago.org/Public-Safety/Crimes-2018/3i3m-jwuy | shapefile | DATA/Chapter5/burglaries18

### Chapter 6: People-Based ML Models

Chapter 6 introduces the use of machine learning in estimating risk/opportunity for individuals. The resulting intelligence is then used to develop a cost/benefit analysis for Bounce to Work! a pogo-transit start-up. The goal is to predict the probability a client will 'churn' or not re-up their membership. This is valuable for public-sector data scientists working with individuals and families. 

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| churnBounce | A churn-related dataset published by IBM. Field names have been modified to better fit the use case | https://www.kaggle.com/blastchar/telco-customer-churn/home | csv | DATA/Chapter6 |
| housingSubsidy | Adopted from Moro & Rita this dataset is provided for the homework assignment | http://archive.ics.uci.edu/ml/datasets/Bank+Marketing | csv | DATA/Chapter6 |

### Chapter 7: People-Based ML Models: Algorithmic Fairness

Chapter 7 evaluates people-based algorithms for 'disparate impact' - the idea that even if an algorithm is not designed to discriminte on its face, it may still have a discriminatory effect. This chapter returns to a criminal justice use case, estimating the _social_ costs and benefits.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| compas-scores-two-years | Dataset of defendants in Broward County, FL screened by COMPAS over two years (2013 and 2014) | https://github.com/propublica/compas-analysis/blob/master/compas-scores-two-years.csv | csv | DATA/Chapter7 |

### Chapter 8: Predicting Rideshare Demand

Chapter 8 builds a space/time predictive model of ride share demand in Chicago. New R functionality is introduced along with functions unique to time series data.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| chicago_rideshare_trips_nov_dec_18_clean_sample| A 20% sample of rideshare trips taken in Chicago for November and December 2018 | https://data.cityofchicago.org/Transportation/Transportation-Network-Providers-Trips/m6dm-c72p | csv | DATA/Chapter8 |
