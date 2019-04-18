## gapminder-analisys.r
## analisys with gapmider data
## J Lowndes lowndes@nceas.ucsb.edu

## Install packages
install.packages("tidyverse")

## Load libraries
library(tidyverse)
library(dplyr)  ## Poder utilizar el pipe function %>%, más muchas otras funciones
library(ggplot2)

## read in gapminder data
gapminder <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv')

## Ejecutar el archivo desde la consola o desde otro archivo .R
# source('gapminder-analisys.r')

## Crear directorio dentro del proyecto
dir.create("figures")

## create a list of countries
country_list <- unique(gapminder$country) # ?unique() returns the unique values

for (cntry in country_list) {
  ## filter the country to plot
  gap_to_plot <- gapminder %>%
    filter(country == cntry)
  
  ## plot
  my_plot <-
    ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap)) +
    geom_point() +
    ## add title and save
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ## add the figures/ folder
  ggsave(filename = paste("figures/", cntry, "_gdpPercap.png", sep = ""), plot = my_plot)
}