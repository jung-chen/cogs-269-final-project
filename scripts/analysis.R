#' ---
#' title: "COGS 269 Final Project: Analysis"
#' author: "Jung Chen"
#' email: "jchen378@ucmerced.edu"
#' 
#' output:
#'   rmarkdown::html_document:
#'     toc: true
#'     toc_float: TRUE
#'     number_sections: TRUE
#'     code_folding: "hide"
#' ---

#### Setup & load packages ####

library(tidyverse)
library(knitr)
library(sessioninfo)
library(lubridate)
library(skimr)

data_dir = file.path('..', 'data')
out_dir = file.path('..', 'out')

if (!dir.exists(out_dir)) {
    dir.create(out_dir)
}

#### Import XML object ####

data_raw <- read.csv(file.path(data_dir, 'data.csv'))

# Skim the data and check it's structure and variable types. All variables are characters, need to change values into numeric and transform date varaibles.
skim(data_raw)

#### Clean data ####

data_clean <- data_raw %>%
    mutate(device = gsub(".*(name:)|,.*", "", device),# Parse easily identifiable device where the data is collected
           value = as.numeric(as.character(value)), # Change character values into numeric
           startDate = ymd_hms(startDate,tz="America/Los_Angeles"), # Specify the correct time zone
           endDate = ymd_hms(endDate,tz="America/Los_Angeles"),
           hour = hour(endDate), # Create hour, date, month, and year variables for further analysis
           date = date(endDate), 
           month = month(endDate),
           year = year(endDate),
           type = str_remove(type, "HKCategoryTypeIdentifier|HKQuantityTypeIdentifier") # parse easily identifiable type of indicator
    )

skim(data_clean)

#### Analysis 1: Step Count during 2020 #### 

# Calculate daily average step counts for each month during 2020
data_a1 <- data_clean %>%
    filter(type == 'StepCount', 
           year == 2020, 
           device == 'Apple Watch') %>%
    group_by(month, date) %>% 
    summarise(value = sum(value)) %>% 
    group_by(month) %>% 
    summarise(value = mean(value)) %>% 
    ungroup()

# Plot the results
ggplot(data_a1, aes(x = month, y = value)) +
    geom_col(fill='darkblue') +
    scale_x_continuous(
      breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
    ) +
    labs(title = "Average Daily Step Counts for Each Month During 2020",
         x = 'Month',
         y = 'Step Counts') +
    theme_bw()+
    theme(panel.border = element_blank(), 
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          )

# Store the plot
ggsave(file.path(out_dir, '01_plot.png'), width = 6, height = 3, scale = 1.5)

#### Analysis 2: Standing Time during 2020 #### 

data_a2 <- data_clean %>%
  filter(type == 'AppleStandTime', 
         year == 2020) %>%
  group_by(month, date) %>% 
  summarise(value = sum(value)) %>% 
  group_by(month) %>% 
  summarise(value = mean(value)) %>% 
  ungroup()

# Plot the results
ggplot(data_a2, aes(x = month, y = value)) +
  geom_col(fill='darkblue') +
  scale_x_continuous(
    breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
  ) +
  labs(title = "Average Daily Standing Time for Each Month During 2020",
       x = 'Month',
       y = 'Standing Time (Minutes)') +
  theme_bw()+
  theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
  )

# Store the plot
ggsave(file.path(out_dir, '02_plot.png'), width = 6, height = 3, scale = 1.5)

#### Analysis 3: Exercise Time during 2020 #### 

data_a3 <- data_clean %>%
  filter(type == 'AppleExerciseTime', 
         year == 2020) %>%
  group_by(month, date) %>% 
  summarise(value = sum(value)) %>% 
  group_by(month) %>% 
  summarise(value = mean(value)) %>% 
  ungroup()

# Plot the results
ggplot(data_a3, aes(x = month, y = value)) +
  geom_col(fill='darkblue') +
  scale_x_continuous(
    breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
  ) +
  labs(title = "Average Daily Exercise Time for Each Month During 2020",
       x = 'Month',
       y = 'Exercise Time (Minutes)') +
  theme_bw()+
  theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
  )

# Store the plot
ggsave(file.path(out_dir, '03_plot.png'), width = 6, height = 3, scale = 1.5)

#### Analysis 4: Heart Rate during 2020 Election #### 

# Calculate hourly average heart rate for each day a week before and after the 2020 election
data_a4 <- data_clean %>%
  filter(type == 'HeartRate', 
         year == 2020, 
         date >= '2020-10-25', 
         date <= '2020-11-14') %>% 
  group_by(hour, date) %>% 
  summarize(value = mean(value)) %>% 
  ungroup()

# Plot the results
ggplot(data_a4, aes(x = hour, y = date,  fill = value)) + 
  geom_tile(color = 'darkblue') + 
  scale_fill_continuous(labels = scales::comma, low = 'grey95', high = '#008FD5') +
  theme(panel.grid.major = element_blank()) +
  geom_hline(yintercept = as.Date('2020-10-31'), color = 'red', alpha= 0.5)+
  geom_hline(yintercept = as.Date('2020-11-08'), color = 'red', alpha= 0.5)+
  scale_x_continuous(
    breaks = c(0, 6, 12, 18),
    label = c("Midnight", "6 AM", "Midday", "6 PM")
  ) +
  labs(title = "Hourly Heart Rate Heatmap a Week Before and After the 2020 Election",
       y='',
       x='',
       fill = 'Heart Rate') +
  theme_bw()+
  theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black")
        )

# Store the plot
ggsave(file.path(out_dir, '04_plot.png'), width = 6, height = 3, scale = 1.5)

#### Analysis 5: Sleep Duration during 2020 Election #### 

# Calculate each day's sleeping duration a week before and after the 2020 election
data_a5 <- data_clean %>%
  filter(type == 'SleepAnalysis', 
         sourceName != 'iPhone',
         year == 2020, 
         date >= '2020-10-25', 
         date <= '2020-11-14') %>% 
  mutate(duration = endDate - startDate) %>% 
  group_by(date) %>% 
  summarize(duration = sum(duration)/60) %>% 
  ungroup()

# Plot the results
ggplot(data_a5, aes(x = date, y = duration)) +
  geom_col(fill='darkblue') +
  geom_vline(xintercept = as.Date('2020-10-31'), color = 'red', alpha= 0.5)+
  geom_vline(xintercept = as.Date('2020-11-08'), color = 'red', alpha= 0.5)+
  labs(title = "Daily Sleeping Duration a Week Before and After the 2020 Election",
       x = 'Month',
       y = 'Sleeping Duration (Hours)') +
  theme_bw()+
  theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
  )

# Store the plot
ggsave(file.path(out_dir, '05_plot.png'), width = 6, height = 3, scale = 1.5)

#### Reproducibility ####
session_info()
