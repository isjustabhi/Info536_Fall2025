# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
gtd_data <- read.csv("global_terrorism.csv", 
                     stringsAsFactors = FALSE)

# Basic data exploration
glimpse(gtd_data)

# Select relevant columns for analysis
gtd_clean <- gtd_data %>%
  select(eventid, iyear, country_txt, region_txt, attacktype1_txt) %>%
  # Remove missing or invalid years
  filter(!is.na(iyear) & iyear > 0) %>%
  # Optional: Filter for a specific year range (1970–2017)
  filter(iyear >= 1970 & iyear <= 2017)

# Inspect the cleaned data
head(gtd_clean)             # First few rows
summary(gtd_clean$iyear)    # Year range check

