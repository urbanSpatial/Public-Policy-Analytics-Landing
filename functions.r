
#plotTheme FOR CHAPTER 1, 6, 7 = title_size = 16
#plotTheme FOR CHAPTER 2       = title_size = 24
#plotTheme FOR CHAPTER 3,4,5,8 = title_size = 14
plotTheme <- function(base_size = 12, title_size = 16) {
  theme(
    text = element_text( color = "black"),
    plot.title = element_text(size = title_size, colour = "black"), 
    plot.subtitle = element_text(face="italic"),
    plot.caption = element_text(hjust=0),
    axis.ticks = element_blank(),
    panel.background = element_blank(),
    panel.grid.major = element_line("grey80", size = 0.1),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(colour = "black", fill=NA, size=2),
    strip.background = element_rect(fill = "grey80", color = "white"),
    strip.text = element_text(size=12),
    axis.title = element_text(size=12),
    axis.text = element_text(size=10),
    plot.background = element_blank(),
    legend.background = element_blank(),
    legend.title = element_text(colour = "black", face = "italic"),
    legend.text = element_text(colour = "black", face = "italic"),
    strip.text.x = element_text(size = 14)
  )
}

#mapTheme FOR CHAPTER 1       = title_size = 16
#mapTheme FOR CHAPTER 2       = title_size = 24
#mapTheme FOR CHAPTER 3,4,5,8 = title_size = 14
mapTheme <- function(base_size = 12, title_size = 16) {
  theme(
    text = element_text( color = "black"),
    plot.title = element_text(size = title_size,colour = "black"),
    plot.subtitle=element_text(face="italic"),
    plot.caption=element_text(hjust=0),
    axis.ticks = element_blank(),
    panel.background = element_blank(),axis.title = element_blank(),
    axis.text = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(colour = "black", fill=NA, size=2),
    strip.text.x = element_text(size = 14))
}

q5 <- function(variable) {as.factor(ntile(variable, 5))}

qBr <- function(df, variable, rnd) {
  if (missing(rnd)) {
    as.character(quantile(round(df[[variable]],0),
                          c(.01,.2,.4,.6,.8), na.rm=T))
  } else if (rnd == FALSE | rnd == F) {
    as.character(formatC(quantile(df[[variable]]), digits = 3),
                 c(.01,.2,.4,.6,.8), na.rm=T)
  }
}

#this function converts a raster to a data frame that can be plotted
rast <- function(inRaster) {
  data.frame(
    xyFromCell(inRaster, 1:ncell(inRaster)), 
    value = getValues(inRaster)) }

##this is the nearest neighbor function
nn_function <- function(measureFrom,measureTo,k) {
  measureFrom_Matrix <-
    as.matrix(measureFrom)
  measureTo_Matrix <-
    as.matrix(measureTo)
  nn <-   
    get.knnx(measureTo, measureFrom, k)$nn.dist
  output <-
    as.data.frame(nn) %>%
    rownames_to_column(var = "thisPoint") %>%
    gather(points, point_distance, V1:ncol(.)) %>%
    arrange(as.numeric(thisPoint)) %>%
    group_by(thisPoint) %>%
    summarize(pointDistance = mean(point_distance)) %>%
    arrange(as.numeric(thisPoint)) %>% 
    dplyr::select(-thisPoint) %>%
    pull()
  
  return(output)  
}

# Multi-ring Buffer
multipleRingBuffer <- function(inputPolygon, maxDistance, interval) 
{
  #create a list of distances that we'll iterate through to create each ring
  distances <- seq(0, maxDistance, interval)
  #we'll start with the second value in that list - the first is '0'
  distancesCounter <- 2
  #total number of rings we're going to create
  numberOfRings <- floor(maxDistance / interval)
  #a counter of number of rings
  numberOfRingsCounter <- 1
  #initialize an otuput data frame (that is not an sf)
  allRings <- data.frame()
  
  #while number of rings  counteris less than the specified nubmer of rings
  while (numberOfRingsCounter <= numberOfRings) 
  {
    #if we're interested in a negative buffer and this is the first buffer
    #(ie. not distance = '0' in the distances list)
    if(distances[distancesCounter] < 0 & distancesCounter == 2)
    {
      #buffer the input by the first distance
      buffer1 <- st_buffer(inputPolygon, distances[distancesCounter])
      #different that buffer from the input polygon to get the first ring
      buffer1_ <- st_difference(inputPolygon, buffer1)
      #cast this sf as a polygon geometry type
      thisRing <- st_cast(buffer1_, "POLYGON")
      #take the last column which is 'geometry'
      thisRing <- as.data.frame(thisRing[,ncol(thisRing)])
      #add a new field, 'distance' so we know how far the distance is for a give ring
      thisRing$distance <- distances[distancesCounter]
    }
    
    
    #otherwise, if this is the second or more ring (and a negative buffer)
    else if(distances[distancesCounter] < 0 & distancesCounter > 2) 
    {
      #buffer by a specific distance
      buffer1 <- st_buffer(inputPolygon, distances[distancesCounter])
      #create the next smallest buffer
      buffer2 <- st_buffer(inputPolygon, distances[distancesCounter-1])
      #This can then be used to difference out a buffer running from 660 to 1320
      #This works because differencing 1320ft by 660ft = a buffer between 660 & 1320.
      #bc the area after 660ft in buffer2 = NA.
      thisRing <- st_difference(buffer2,buffer1)
      #cast as apolygon
      thisRing <- st_cast(thisRing, "POLYGON")
      #get the last field
      thisRing <- as.data.frame(thisRing$geometry)
      #create the distance field
      thisRing$distance <- distances[distancesCounter]
    }
    
    #Otherwise, if its a positive buffer
    else 
    {
      #Create a positive buffer
      buffer1 <- st_buffer(inputPolygon, distances[distancesCounter])
      #create a positive buffer that is one distance smaller. So if its the first buffer
      #distance, buffer1_ will = 0. 
      buffer1_ <- st_buffer(inputPolygon, distances[distancesCounter-1])
      #difference the two buffers
      thisRing <- st_difference(buffer1,buffer1_)
      #cast as a polygon
      thisRing <- st_cast(thisRing, "POLYGON")
      #geometry column as a data frame
      thisRing <- as.data.frame(thisRing[,ncol(thisRing)])
      #add teh distance
      thisRing$distance <- distances[distancesCounter]
    }  
    
    #rbind this ring to the rest of the rings
    allRings <- rbind(allRings, thisRing)
    #iterate the distance counter
    distancesCounter <- distancesCounter + 1
    #iterate the number of rings counter
    numberOfRingsCounter <- numberOfRingsCounter + 1
  }
  
  #convert the allRings data frame to an sf data frame
  allRings <- st_as_sf(allRings)
}

# Cross-validate function from chapter 5 (left in chapter)
crossValidate <- function(dataset, id, dependentVariable, indVariables) {
  
  allPredictions <- data.frame()
  cvID_list <- unique(dataset[[id]])
  
  for (i in cvID_list) {
    
    thisFold <- i
    cat("This hold out fold is", thisFold, "\n")
    
    fold.train <- filter(dataset, dataset[[id]] != thisFold) %>% as.data.frame() %>% 
      dplyr::select(id, geometry, indVariables, dependentVariable)
    fold.test  <- filter(dataset, dataset[[id]] == thisFold) %>% as.data.frame() %>% 
      dplyr::select(id, geometry, indVariables, dependentVariable)
    
    regression <-
      glm(countBurglaries ~ ., family = "poisson", 
          data = fold.train %>% 
            dplyr::select(-geometry, -id))
    
    thisPrediction <- 
      mutate(fold.test, Prediction = predict(regression, fold.test, type = "response"))
    
    allPredictions <-
      rbind(allPredictions, thisPrediction)
    
  }
  return(st_sf(allPredictions))
}

# Iterate Thresholds Chapter 6, 7 (left in Chapters)
iterateThresholds <- function(data, observedClass, predictedProbs, group) {
  #This function takes as its inputs, a data frame with an observed binomial class (1 or 0); a vector of predicted #probabilities; and optionally a group indicator like race. It returns accuracy plus counts and rates of confusion matrix #outcomes. It's a bit verbose because of the if (missing(group)). I don't know another way to make an optional parameter.
  observedClass <- enquo(observedClass)
  predictedProbs <- enquo(predictedProbs)
  group <- enquo(group)
  x = .01
  all_prediction <- data.frame()
  
  if (missing(group)) {
    
    while (x <= 1) {
      this_prediction <- data.frame()
      
      this_prediction <-
        data %>%
        mutate(predclass = ifelse(!!predictedProbs > x, 1,0)) %>%
        count(predclass, !!observedClass) %>%
        summarize(Count_TN = sum(n[predclass==0 & !!observedClass==0]),
                  Count_TP = sum(n[predclass==1 & !!observedClass==1]),
                  Count_FN = sum(n[predclass==0 & !!observedClass==1]),
                  Count_FP = sum(n[predclass==1 & !!observedClass==0]),
                  Rate_TP = Count_TP / (Count_TP + Count_FN),
                  Rate_FP = Count_FP / (Count_FP + Count_TN),
                  Rate_FN = Count_FN / (Count_FN + Count_TP),
                  Rate_TN = Count_TN / (Count_TN + Count_FP),
                  Accuracy = (Count_TP + Count_TN) / 
                    (Count_TP + Count_TN + Count_FN + Count_FP)) %>%
        mutate(Threshold = round(x,2))
      
      all_prediction <- rbind(all_prediction,this_prediction)
      x <- x + .01
    }
    return(all_prediction)
  }
  else if (!missing(group)) { 
    while (x <= 1) {
      this_prediction <- data.frame()
      
      this_prediction <-
        data %>%
        mutate(predclass = ifelse(!!predictedProbs > x, 1,0)) %>%
        group_by(!!group) %>%
        count(predclass, !!observedClass) %>%
        summarize(Count_TN = sum(n[predclass==0 & !!observedClass==0]),
                  Count_TP = sum(n[predclass==1 & !!observedClass==1]),
                  Count_FN = sum(n[predclass==0 & !!observedClass==1]),
                  Count_FP = sum(n[predclass==1 & !!observedClass==0]),
                  Rate_TP = Count_TP / (Count_TP + Count_FN),
                  Rate_FP = Count_FP / (Count_FP + Count_TN),
                  Rate_FN = Count_FN / (Count_FN + Count_TP),
                  Rate_TN = Count_TN / (Count_TN + Count_FP),
                  Accuracy = (Count_TP + Count_TN) / 
                    (Count_TP + Count_TN + Count_FN + Count_FP)) %>%
        mutate(Threshold = round(x,2))
      
      all_prediction <- rbind(all_prediction,this_prediction)
      x <- x + .01
    }
    return(all_prediction)
  }
}

# Iterate Fairness Chapter 7 (left in chapter)
iterateFairness <- function(data, regression, threshold.by) {
  #create a table of all possible threshold combinations and input how many different thresholds to test.
  all.combos <- expand.grid(group1 = seq(0.1 , 1, threshold.by), group2 = seq(0.1,1 ,threshold.by))
  all_prediction <- data.frame()
  #while `counter` is less than the number of possible threshold combinations 
  counter = 1
  while (counter <= nrow(all.combos)) {
    this_prediction <- data.frame()
    #choose the next i thresholds    
    group1.thresh <- all.combos[counter,1]
    group2.thresh <- all.combos[counter,2]
    #create a temporary table that includes the predicted probability    
    this_prediction <- data.frame(
      observed = data[["Recidivated"]],
      probs = predict(regression, data, type="response"),
      race = data[["race"]]) %>%
      mutate(predicted = 
               case_when(race == "African-American" & probs >= group1.thresh  ~ "Recidivate",
                         race == "Caucasian" & probs >= group2.thresh  ~ "Recidivate",
                         TRUE ~"notRecidivate"),
             predicted = as.factor(predicted)) %>%
      #calculate fairness metrics
      group_by(race) %>%
      count(predicted,observed) %>%
      summarize(True_Negative = sum(n[predicted=="notRecidivate" & observed=="notRecidivate"]),
                True_Positive = sum(n[predicted=="Recidivate" & observed=="Recidivate"]),
                False_Negative = sum(n[predicted=="notRecidivate" & observed=="Recidivate"]),
                False_Positive = sum(n[predicted=="Recidivate" & observed=="notRecidivate"]),
                False_Positive_Rate = False_Positive / (False_Positive + True_Negative),
                False_Negative_Rate = False_Negative / (False_Negative + True_Positive),
                Accuracy = (True_Negative + True_Positive) /  
                  (True_Negative + True_Positive + False_Negative + False_Positive)) %>%
      mutate(threshold = paste(group1.thresh, group2.thresh, sep=", "))
    #store this outcome on a larger table
    all_prediction <- rbind(all_prediction,this_prediction)
    #iterate     
    counter <- counter + 1
  }
  #return fairness metrics for all threshold combinations
  return(all_prediction)
}  

