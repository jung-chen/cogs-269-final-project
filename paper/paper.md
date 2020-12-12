---
title: "Life of Jung"
author: Jung Chen
date: \today

colorlinks: true

---

# Introduction #

2020 has been a rough year for every one of us. Students and professors alike, we've experienced an unprecedented pandemic, the shutdown of the functioning society we know of, and as well as an atrocious and unhinged election. People are feeling depressed and anxious on a daily basis while stressed about the uncertainty of when the so-called normal life can return. Deep down, we all ask ourselves the same question: is now like then, and will it be again? Needless to say, understanding how people are coping with these external factors that could sabotage their mental health during this quixotic year is critical.  

How best to measure people's mental status? Obviously, self-reported surveys are always the easiest way to go by simply asking people to assess their own mental and physical well-being. However, such measures have several drawbacks. First, human cognition suggests that sometimes we can be unaware of our true feelings or unable to accurately map these feelings onto existing survey measures, which can introduce unwanted noises. Second, people's attitudes can be fluid and momentary. Yet, survey results only reveal measures right at the moment when they are taking the survey, which can only provide us with an incomplete picture of the empirical pattern we are interested in. Albeit methods such as ecological momentary assessment exist, it's still difficult to capture a continuous catalog of people's attitudes and behaviors throughout their daily lives. 

Recent innovations in technology offer a solution to the aforementioned problems through collecting data from wearable sensors. Nowadays, some people are accustomed to using products like Fitbits and Apple Watch, which periodically and continuously measures their physical indicators as long as they are wearing it. These indicators, such as heart rate variability, sociometers of physical activities, and sleeping length, can also be used to extrapolate mental and emotional states. In addition, they represent the implicit pattern of people's mental and physical status that people may not be consciously aware of. While implicit indicators are not necessarily truer than explicit measures, they can still unveil a different, perhaps more interesting, aspect of people's feelings and behaviors. 

This short report intends to explore people's physical activities and infer their mental states during the COVID-19 pandemic and the 2020 presidential election via the lens of wearable sensor data. However, publicly available data of this kind is very difficult to obtain, and it's beyond the author's ability to carry out original surveys due to financial and ethical concerns. Hence, this report focuses on the case study of one single individual: Jung Chen. Jung Chen is a graduate student in political science who has been using Apple Watch for a little over a year now. The nature of his occupation dictates that he is always stressed and tired; the subject of his discipline indicates that he is interested in and more easily being influenced by political events. Plus, he just so happens to be the author of this report. Unquestionably, he is the perfect case for the purpose of this study. Thus, this report examines the pattern of Jung Chen's physical indicators as collected by his wearable sensor devices and whether these trends change with regard to the COVID-19 pandemic and the 2020 election. 

# Data #

This report uses Jung Chen's Apple Health data extracted from his iPhone and Apple Watch by the end of December 11, 2020. The raw data contains 438303 rows and 9 variables. Each row represents a catalog of data entry collected at a specific time point during the day. The below table illustrates the descriptions of the variables. 

\begin{table}[h!]
\centering
\caption{Table 1: Variable Descriptions} 
\begin{tabular}{ |p{2cm}|p{9cm}|}
 \hline
 Column Name & Description  \\ 
  \hline
 type & 24 different types of indicators included in the Apple Health data. Primary interest in this report: StepCount, StandTime, ExerciseTime, HeartRate, SleepAnalysis . \\ 
  \hline
 sourceName & Source of the data: Clock, Health, iPhone, Jung's Apple Watch, Sleep. \\ 
 \hline
 sourceVersion & Version of the device at the time of data collection. \\ 
 \hline
unit & Unit of the type of indicators (e.g. minute for StandTime, count/min for HeartRate) \\ 
 \hline
creationDate & Date and time when the data entry is created in GMT+8 time zone\\ 
 \hline
startDate & Date and time when the data collection begins in GMT+8 time zone \\ 
 \hline
endDate & Date and time when the data collection ends in GMT+8 time zone \\ 
 \hline
value & Value of the indicators \\ 
 \hline
device & Device used for data collection: iPhone, Apple Watch \\ 
 \hline
\end{tabular}
\end{table}

For the purpose of this report, I focus on analyzing five specific indicators: step counts, standing time, exercise time, heart rate, and sleeping duration. I first restricted the data to those collected in 2020, and group the rows into days or hours as units to perform two kinds of analysis. First, I examine the trend of averaged daily step counts, standing time, and exercise time for each month of 2020. Second, I look at the patterns of heart rate and sleeping duration a week before and after the 2020 presidential election. 

# Results #

## Pandemic ##

Figure 1, 2, and 3 plot the average step counts, standing time, and exercise time each day for the months of 2020. Data wasn't collected for the month of April and June because, at some point in time, I was too lazy to put on my Apple Watch every day since I can't leaving the house. As can be seen from the plots, I basically stopped moving a lot when the quarantine began. Keep in mind that the step counts here can be an overestimation since sometimes Apple Watch perceives people are moving when instead they are simply waving their hands. It makes sense that the step counts and exercise time dropped drastically due to the stay-at-home order, but I even lost the enthusiasm to stand up from time to time in my house when everything is clouded by the pandemic as compared to the good old times. 

![Average Daily Step Counts for Each Month During 2020 \label{fig:plot}](../out/01_plot.png)

![Average Daily Standing Time for Each Month During 2020 \label{fig:plot}](../out/02_plot.png)

![Average Daily Exercise Time for Each Month During 2020 \label{fig:plot}](../out/03_plot.png)

\pagebreak

## Election ##

Here I analyze how the 2020 election affected me using two indicators: heart rate and sleeping durations. Figure 4 plots the heatmap of hourly heart rate each day a week before and after the election. The area between the two red horizontal lines represents the election week. Visually speaking, it seems that my heart rate was generally higher during the election week as compared to the week before and after the election. Specifically, the period from November 3, the election day, to November 5 in which the result of the election remained undecided due to the delayed counting of mail-in ballots, my heart rate was generally higher during the hours I was awake, perhaps an indications that I was troubled by the uncertainty of the electoral outcomes. 

![Hourly Heart Rate Heatmap a Week Before and After the 2020 Election \label{fig:plot}](../out/04_plot.png)

Figure 5 plots how long I slept each day a week before and after the election. The area between the two red vertical lines represents the election week. Visually speaking, I seem to have slept somewhat less the week before the election; and during the election week, I slept pretty normally. Base on this indicator, I didn't seem to behave unusually during the election periods.

![Daily Sleeping Duration a Week Before and After the 2020 Election \label{fig:plot}](../out/05_plot.png)

\pagebreak

# Discussion #

This report explores the pattern of Jung Chen's physical indicators as collected by his wearable sensor devices and whether these trends change with regard to the COVID-19 pandemic and the 2020 presidential election. The first part of the exploratory analysis unveils that he moved, stood, and exercised significantly less when the pandemic and the quarantine began. Even after the stay-at-home order was not too strict around summer, his movement indicators still didn't return to the level before this pandemic. Secondly, I analyze whether the infamous 2020 presidential election exacted a toll on his physical and, perhaps, mental well-being. Preliminary findings indicate that he seemed to experienced aroused heart rate on a daily basis, particularly during the election week, which either suggests that he was super excited about the election (probably not) or he felt more than anxious about the uncertainty of this chaotic election. Nonetheless, he seemed to have slept just fine during those days; perhaps a sweet dream was the only solace he could seek with all the madness happening around the world. 

This report focuses on a single individual as a case study. Moving forward, future studies can try to collect more data, either through conducting original surveys or seek potentially proprietary data. In addition, it can also be good to combine external datasets, such as the mobility report of Apple and Google, to draw more interesting inferences. As a result, understanding how people are coping with this unparalleled pandemic and the disturbing political atmosphere can allow to find ways to improve the well-being of the society we are living in, and generate a brighter tomorrow to come.  









