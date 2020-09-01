# Public Policy Analytics

[Public Policy Analytics](https://urbanspatial.github.io/PublicPolicyAnalytics/) is a new book by Ken Steif, Ph.D that teaches at the intersection of data science and public policy. Designed for students studying City Planning and related disciplines, the book teaches both code and context toward improved public-sector decision making. Readers can expect an introduction to R, geospatial data science, and machine learning, coveyed through real world use cases of data science in government.

All of the book's data is free and open source compiled from across the web. Each chapter includes API calls that read data directly into R. However, for posterity, the [DATA](https://github.com/urbanSpatial/Public-Policy-Analytics-Landing/tree/master/DATA) folder on this repo has all the data, organized by chapter. The sections below provide a description of each dataset and the original source, when applicable. 

### Chapter 1: Indicators for Transit Oriented Development

Chapter 1 is a introduction to indicators and their importance in conveying complex processes to decision makers. Introducing the `tidyverse`, `tidycensus`, and `sf` packages, this chapter analyzes whether Philadelphia renters are willing to pay a premium for transit amenities.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| SEPTA_Broad | Stations on the Broad Street line | http://septaopendata-septa.opendata.arcgis.com/datasets/septa-broad-street-line-stations | geojson | DATA/Chapter1/Stations |
| SEPTA_El | Stations on the Market Frankford (El) line | http://septaopendata-septa.opendata.arcgis.com/datasets/septa-market-frankford-line-stations | geojson | DATA/Chapter1/Stations |

### Chapter 2: Expanding the Urban Growth Boundary

Chapter 2 explores the discontinuous nature of boundaries to understand they impact development. Using the Urban Growth Boundary in Lancaster County, PA as an example, this chapter illustrates how boundaries can be used to promote infill development and curb suburban sprawl.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| studyAreaTowns | Towns inside of the Lancaster County study area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1267 | shapefile | DATA/Chapter2/studyAreaTowns |
| Urban_Growth_Boundary | Lancer County's Urban Growth Area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1274 | shapefile | DATA/Chapter2/UGB |
| LancasterCountyBuildings | Footprints for all buildings in the study area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1257 | shapefile | DATA/Chapter2/LancasterCountyBuildings |
| LancasterCountyBoundary | Spatial extent of Lancaster County | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=1260 | shapefile | DATA/Chapter2/LancasterCountyBoundary |
| LancasterGreenSpace | Non-developed land cover in the study area | http://www.pasda.psu.edu/uci/DataSummary.aspx?dataset=3154 | shapefile | DATA/Chapter2/LancasterCountyGreenSpace |

### Chapters 3 & 4: Intro to Geospatial Machine Learning

Chapters 3 and 4 provide a first look at predictive analytics. Predicting home prices in Boston, MA, Chapter 3 introduces linear regression and goodness of fit metrics to asses the accuracy and generalizability of the predictive model. Chapter 4 builds on the initial analysis to account for the spatial pattern of home sales.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| Boston_Nhoods | Neighborhoods in Boston, MA | https://data.boston.gov/dataset/boston-neighborhoods | shapefile | DATA/Chapter3_4/Boston_Nhoods |
| bostonHousePriceData_clean | Sale price and housing characteristics of homes sold in Boston between August 2015 and August 2016 | https://data.boston.gov/dataset/property-assessment | csv | DATA/Chapter3_4 |
| bostonCrimes | Crimes in Boston that occurred between August 2015 and August 2016 | https://data.boston.gov/dataset/crime-incident-reports-august-2015-to-date-source-new-system | csv | DATA/Chapter3_4 |
| boston_sf_Ch1_wrangled | All data wrangled in Chapter 3 that can be used in Chapter 4 if analysis is not completed all at once |  | geojson | DATA/Chapter3_4

### Chapter 5: Geospatial Risk Modeling - Predictive Policing

Chapter 5 tackles the controversial topic of predictive policing. This chapter introduces the geospatial risk model to predict the risk of burglaries in Chicago, IL and evaluates the risk model by comparing it to the ubiquitous kernel density estimation.

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

Chapter 6 introduces how data science can be used to identify risk/opportunity for individuals. Teaching how to predict for individuals, Chapter 6 uses the resulting intelligence to develop a cost/benefit analyses for Bounce to Work! a pogo-transit start-up. Particularly the goal is to predict the probability a client will churn (not re-subscribe) for Bounce to Work!'s membership.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| churnBounce | A churn-related dataset published by IBM. Field names have been modified to better fit the use case | https://www.kaggle.com/blastchar/telco-customer-churn/home | csv | DATA/Chapter6 |
| housingSubsidy | Adopted from Moro & Rita this dataset is provided for the homework assignment | http://archive.ics.uci.edu/ml/datasets/Bank+Marketing | csv | DATA/Chapter6 |

### Chapter 7: People-Based ML Models: Algorithmic Fairness

Chapter 7 focuses on evaluating people-based algorithms to understand pertinent social costs associated with them. Using data published by ProPublica, a model is estimated to predict recidivism and several analytics are created to better judge the fairness of person-based predictive algorithms and the disparate impact they may have.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| compas-scores-two-years | Dataset of defendants in Broward County, FL screened by COMPAS over two years (2013 and 2014) | https://github.com/propublica/compas-analysis/blob/master/compas-scores-two-years.csv | csv | DATA/Chapter7 |

### Chapter 8: Predicting Rideshare Demand

Chapter 8 return to spatial problem solving to predict space/time demand for ride share in Chicago. While similar to the other geospatial models built in the book so far, this chapter focuses on effects in time adding an additional complexity.

| Dataset        | Description    | Open Data URL  | File Type | Location |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| chicago_rideshare_trips_nov_dec_18_clean_sample| A 20% sample of rideshare trips taken in Chicago for November and December 2018 | https://data.cityofchicago.org/Transportation/Transportation-Network-Providers-Trips/m6dm-c72p | csv | DATA/Chapter8 |
