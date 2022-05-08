# The_Final_Project_Data_Visualization

This is the final Team 8 project for the Rutgers Data Visualization Bootcamp

# Team

Team 8:
Presentation and GitHub - Dennis Smith

Machine Learning Model - Helanga W. Hettigamage

Database - Uma K Iyer

Dashboard - Revati Kulkarni

### Table of Contents
* [Team](#team)
* [General info](#general-info)
* [Questions](#questions)
* [Data Source](#data-source)
* [ETL](#ETL)
* [Data Cleaning](#data-cleaning)
* [Machine Learning](#machine-learning)
* [Data Visualization](#data-visualization)
* [Reports Instructions](#reports-instructions)

# General info

Team members have drafted their project, including the following:

✓ Selected topic: The U.S. Department of Transportation’s National Highway Traffic Safety Administration released its 2021 annual traffic crash data, showing that 38,824 lives were lost in traffic crashes nationwide. That number marks the highest number of fatalities since 2007. Our team got interested in studying and analyzing about this data.

✓ Reason why they selected their topic: All of the USA heavily rely on car or some form of road transportation every day. Apart from pandemic time, our major part of the day is spend on commute in onr form or other. So road safety, accidents are the issues close to our heart. Hence our team decided to analyze and get insight from the data available from government agencies on road accidents in the USA.

# Data Source
✓ Description of their source of data: While searching for data, we came across <https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents>. This is a countrywide car accident dataset, which covers 49 states of the USA. The accident data are collected from February 2016 to Dec 2021, using multiple APIs that provide streaming traffic incident (or event) data. These APIs broadcast traffic data captured by a variety of entities, such as the US and state departments of transportation, law enforcement agencies, traffic cameras, and traffic sensors within the road-networks. Currently, there are about 2.8 million accident records in this dataset. This dataset has been collected in real-time, using multiple Traffic APIs. Currently, it contains accident data that are collected from February 2016 to Dec 2021 for the Contiguous United States.

# Questions

✓ Questions they hope to answer with the data: US-Accidents can be used for numerous applications such as real-time car accident prediction, studying car accidents hotspot locations, casualty analysis and extracting cause and effect rules to predict car accidents, and studying the impact of precipitation or other environmental stimuli on accident occurrence. The most recent release of the dataset can also be useful to study the impact of COVID-19 on traffic behavior and accidents. Our team is planning to find the answers to questions such as:
* Which City in US has reported most no. of Accident Cases in last 5 years (2016-2021) ?
* Done in PostgresSQL
![last 5 Years](/IMAGES/count_year.png)
* Which are the top 10 accident prone streets in US ?
*  Done in PostgresSQL
![top 10](/IMAGES/New-York-City-Car-Accident-Statistics-1-300x200.webp)
* Per Day averagely how many road accidents took place in US ?
* Done in PostgresSQL
![top 10](/IMAGES/New-York-City-Car-Accident-Statistics-1-300x200.webp)
* In which hours of the day most accidents happened in US ?
![top 10](/IMAGES/count_hour.png)
* Tableu Bar Chart
![top 10](/IMAGES/New-York-City-Car-Accident-Statistics-1-300x200.webp)
* Which are the top 10 States with most no. of road accident cases in US ?
 Done in PostgresSQL
 ![top 10](/IMAGES/New-York-City-Car-Accident-Statistics-1-300x200.webp)
-
Notes: The following files were created by Uma and Helenga to describe the process for Data Prep/Cleaning and Machine Learning Stage 1

[Data Prep/Cleaning Process text file link](https://github.com/DennisPSmith5676/DataVisualization_US_Accidents/blob/DataCleaning/DataClean/ETLprocess.txt)

[Machine Learning Process text file link](https://github.com/DennisPSmith5676/DataVisualization_US_Accidents/blob/MachineLearningModel/MLStage1.txt)

# Data Cleaning

✓ Description of the communication protocols: We are meeting 5 times a week and reviewing all changes before we commit the code and files to the main branch.

# Machine Learning

How we can work on this problem with machine learning!
The basic idea we had was, why not train some models on the dataset and use those models to get the feature importance to figure out which factors contribute the most to an accident. These can be weather, time of day, month of the year, and the location as some areas are more prone than others. This same approach can be used to predict accidents in real time based on user input.

First cut approach to the problem
Do some basic Exploratory Data Analysis to get some insights into the data;
We will be using the “Severity” feature as our target variable to train the models.
Remove some features that are highly correlated which can help us in reducing overfitting.
Create some new features by using feature engineering techniques.
Trying several feature encoding techniques based on the nature of the feature.
Over and undersampling the data as the number of points per target variable is disproportionate.
Train some models on them and get feature importance for each model.

This dataset contains 49 columns which means we are dealing with 49 features in total which is a little bit too much. We will try to remove some of them and maybe combine some columns into one.

We can note that the distribution of class labels is very disproportionate:

The number points in both the highest and lowest severity classes is much lower(almost 0 for the lowest severity) which can lead to the conclusion that most accidents are moderately severe in degree.

We will now try to see which states are most accident prone

California, Texas and Florida alone make up almost 40% of all the accidents that took place.

Now we should see what weather conditions are most common when accidents occur

This makes it look like accidents are most likely in clear weather but that may not be the case, it’s just that most of the time the weather is clear so to get a good idea of likelihood according to weather, this may not be the ideal way. To get a realistic picture, we also need full weather data for the period which we don’t have at the moment but you can try this yourself with some weather API.

Next, we’ll try to see what time of day are the accidents more likely by plotting the number of accidents on y-axis and hour of day on x-axis:

We can see that the most accidents occur at around 8–9 am in the morning and then there is a second surge at 4 to 5 pm. We know that this is the time when most people travel to and from work, which results in increasing the traffic density which in turn leads to more accidents.

We can also note that as the day goes on, starting from evening time, the percentage of higher severity accidents also increases substantially. It can be concluded with this that as the sun goes down, the accidents are much more drastic even though the overall number of accidents decreases due to the existence of less cars on the road.

Since, we are using severity as our target variable, let’s also try to see if weather has an effect on the severity of the accident
We may note that as the weather conditions worsen, the accidents of higher severities make up for a greater fraction of the overall accidents in that weather condition, we can note this by looking at the difference between lengths of bars for each condition.

# ETL

![top 10](/IMAGES/ERD-US_Accident.png)

Model building and feature engineering
We now have some necessary insights into the dataset so, we can move on to modelling and experimentation along with some feature engineering since this is a machine learning task.

New features
We can start with adding some new features based on time of day and month etc. as these things seem to be highly relevant in predicting the accident severity.
We’ll then remove some outliers and negative features. Also, we should drop the features with a high number of null values since those can add noise to the models.

We didn’t do one-hot encoding of any features due to large number of possible values for most features and computational limitations, but it can be tried if you have the resources to run it. We encoded some features with value counts.

Over and under-sampling of data points
Through the EDA above, we can clearly notice that the class distribution in this dataset is very imbalanced. This is due to the fact that the lowest and highest severity accidents don’t occur as often as compared to other two severities so we don’t have adequate data for those classes. This means if we used the data in its existing condition then the model may never give predictions which have those probabilities. To counter this we will try to under sample the over represented classes and over sample the under represented classes. This wouldn’t completely get rid of the problem but it’s better than nothing.

We used RandomUndersampler method of the imblearn library as we have adequate points for those classes and it wouldn’t hurt to just randomly get rid of some of those points and use SMOTE method to over sample as it is the most robust of all the over sampling methods currently available to us. This process can be done in only a few lines of code as given below:

# Data Visualization

![top 10](/IMAGES/image.png)

Modelling part
We tested 6 machine learning models along with variations between encoding types and including and excluding some of the custom features, the main models I used are the following:

1. Random Forest: Random forest is an ensemble of decision trees, usually trained with the “bagging” method. The general idea of the bagging method is that a combination of learning models increases the overall result. So, we can say that this is just an ensemble of decision trees. This doesn’t require much hyper-parameter tuning.
  
2. SMOTEENN: Used to perform over-sampling using SMOTE and cleaning using ENN. Combine over- and under-sampling using SMOTE and (ENN) Edited Nearest Neighbours.  
  
3. SMOTE works by utilizing a k-nearest neighbour algorithm to create synthetic data. SMOTE first start by choosing random data from the minority class, then k-nearest neighbours from the data are set. Synthetic data would then be made between the random data and the randomly selected k-nearest neighbour)

4. KMEANS:k-means clustering is a method of vector quantization, originally from signal processing, that aims to partition n observations into k clusters in which each observation belongs to the cluster with the nearest mean (cluster centers or cluster centroid), serving as a prototype of the cluster.

5. Naive Random Oversampling: Naïve Bayes is a simple learning algorithm that utilizes Bayes’ rule together with a strong assumption that the attributes are conditionally independent given the class. While this independence assumption is often violated in practice, naïve Bayes nonetheless often delivers competitive classification accuracy. Coupled with its computational efficiency and many other desirable features, this leads to naïve Bayes being widely applied in practice.


6. ClusterCentroids resampler(Undersampling)

We can see that Random ForestRandom Forest response encoding and resampling gives us the best results out of all the models we tested. So, we can conclude that this combination is the best for this dataset.
  # Reports Instructions
Further Improvements:
One-hot encoding can be tried for some of the features.
Weighted XGBoost and other similar models can be implemented instead of resampling the dataset.
Some basic MLP model to compare against our best model here.

References:
  
<https://arxiv.org/pdf/1906.05409.pdf>

<https://smoosavi.org/datasets/us_accidents>

<https://arxiv.org/pdf/1909.09638.pdf>

<https://medium.com/@pushkarmandot/https-medium-com-pushkarmandot-what-is-lightgbm-how-to-implement-it-how-to-fine-tune-the-parameters-60347819b7fc>

Acknowledgements:
Moosavi, Sobhan, Mohammad Hossein Samavatian, Srinivasan Parthasarathy, and Rajiv Ramnath. “A Countrywide Traffic Accident Dataset.”, 2019.

Moosavi, Sobhan, Mohammad Hossein Samavatian, Srinivasan Parthasarathy, Radu Teodorescu, and Rajiv Ramnath. "Accident Risk Prediction based on Heterogeneous Sparse Data: New Dataset and Insights." In proceedings of the 27th ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems, ACM, 2019.
