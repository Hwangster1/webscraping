##_____________________________###
#                                #
#  Web Scrapping_Homework     #
#                                #
##_____________________________###

# Install and load the packages
# rvest for scraping and dplyr for piping

if (!require("pacman")) install.packages("pacman")

# Load contributed packages with pacman
pacman::p_load(rvest, dplyr, tidyverse)


# Problem:------------------------------
# Go to webpage https://www.american.edu/cas/mathstat/faculty/ 
# and scrape name-email-phone- of faculty/staff.
# Put all files in a csv file called "faculty.csv" and submit it to Canvas.

url <- "https://www.american.edu/cas/mathstat/faculty/"
page <- read_html(url)

faculty_blocks <- page %>% html_nodes(".flex-3")
faculty_data <- tibble(
  phone = faculty_blocks %>% html_node(".profile-phone") %>% html_text(trim = TRUE),
  email = faculty_blocks %>% html_node(".profile-email") %>% html_text(trim = TRUE),
  name = faculty_blocks %>% html_node(".profile-name") %>% html_text(trim = TRUE)
)

write.csv(faculty_data, "faculty.csv")
