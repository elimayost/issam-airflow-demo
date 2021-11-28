
# Bring needed libraries
library(data.table , warn.conflicts = FALSE)
library(ggplot2    , warn.conflicts = FALSE)

# Bring utility functions
source("/cmt/utils/utils.R")

# Get data from GCS
explosives_use_timeline_df    <- get_object("explosives_use_timeline.rds")
top_10_dangerous_countries_df <- get_object("top_10_dangerous_countries.rds")
suicide_prevalence_df         <- get_object("suicide_prevalence.rds")

# Generate graphs
generate_top_10_dangerous_countries_graph <- function(){
  ggplot(top_10_dangerous_countries_df, aes(x = reorder(country, -total), y = total, text = sprintf("Country: %s\nTotal: %s", country, total))) + 
    geom_col(fill = "steelblue") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90), axis.title = element_blank())
}

generate_explosives_use_timeline_graph <- function(){
  ggplot(explosives_use_timeline_df, aes(x = year, y = total, group = 1, text = sprintf("Year: %s\nTotal: %s", year, total))) + 
    geom_line(color = "steelblue") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90), axis.title = element_blank())
}

generate_suicide_prevalence_graph <- function(){
  ggplot(suicide_prevalence_df, aes(x = suicide, y = total, fill = suicide, text = sprintf("Suicide: %s\nTotal: %s", suicide, total))) + 
    geom_col() +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90), axis.title = element_blank())
}

