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
# Keep only event ID, year, country, region, and attack type
gtd_clean <- gtd_data %>%
  select(eventid, iyear, country_txt, region_txt, attacktype1_txt)

#Remove missing or invalid years
gtd_clean <- gtd_clean %>%
  filter(!is.na(iyear) & iyear > 0)

#Optional: Filter for a specific year range (1970–2017)
gtd_clean <- gtd_clean %>%
  filter(iyear >= 1970 & iyear <= 2017)

#Inspect the cleaned data
head(gtd_clean)      # Check first few rows
summary(gtd_clean$iyear) # Verify year range

#Save the cleaned dataset
write.csv(gtd_clean, "cleaned_attacks_by_year.csv", row.names = FALSE)

# Data wrangling complete. The cleaned dataset
# is ready for counting attacks and visualization.

