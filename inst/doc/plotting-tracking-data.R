## ----vignette-options, include = FALSE----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "plotting-tracking-data-",
  out.width = "100%",
  dpi = 600
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup, eval = FALSE------------------------------------------------------
# library(sportyR)
# library(ggplot2)

## ----setup-ran, echo = FALSE--------------------------------------------------
library(sportyR)
suppressPackageStartupMessages(library(ggplot2))

## ----download-data------------------------------------------------------------
# Read data from the Big Data Cup
bdc_data <- data.table::fread(
  glue::glue(
    "https://raw.githubusercontent.com/bigdatacup/Big-Data-Cup-2021",
    "/main/hackathon_nwhl.csv"
  )
)

# Convert to data frame
bdc_data <- as.data.frame(bdc_data)

## ----bdc-data-column-names----------------------------------------------------
names(bdc_data)

## ----clean-bdc-data-----------------------------------------------------------
# Change names of X Coordinate and Y Coordinate to x and y respectively
names(bdc_data)[13:14] <- c("x", "y")
names(bdc_data)[20:21] <- c("x2", "y2")

# Preview what the data looks like
knitr::kable(head(bdc_data))

## ----subset-bdc-shot-data-----------------------------------------------------
# Subset to only be shots from the game on 2021-01-23 between the Minnesota
# White Caps and Boston Pride
bdc_shots <- bdc_data[(bdc_data$Event == "Shot") &
                        (bdc_data$`Home Team` == "Minnesota Whitecaps") &
                        (bdc_data$game_date == "2021-01-23"), ]

# Separate shots by team
whitecaps_shots <- bdc_shots[bdc_shots$Team == "Minnesota Whitecaps", ]
pride_shots <- bdc_shots[bdc_shots$Team == "Boston Pride", ]

## ----transform-bdc-shot-data--------------------------------------------------
# Correct the shot location
whitecaps_shots["x"] <- 200 - whitecaps_shots["x"]
whitecaps_shots["y"] <- 85 - whitecaps_shots["y"]

## ----draw-rink, dev = "png"---------------------------------------------------
# Draw the rink
phf_rink <- geom_hockey("phf", x_trans = 100, y_trans = 42.5)

# Display the rink here
phf_rink

## ----add-bdc-shot-data-to-plot, dev = "png"-----------------------------------
# Add the shots to the plot
phf_rink +
  geom_point(data = whitecaps_shots, aes(x, y), color = "#2251b8") +
  geom_point(data = pride_shots, aes(x, y), color = "#fec52e")

## ----passing-data-example, dev = "png"----------------------------------------
# Subset the data to be Boston's passes
boston_passes <- bdc_data[(bdc_data$Event == "Play") &
                            (bdc_data$Team == "Boston Pride") &
                            (bdc_data$game_date == "2021-01-23"), ]

# Plot passes with geom_segment()
phf_rink +
  geom_segment(
    data = boston_passes,
    aes(
      x = x,
      y = y,
      xend = x2,
      yend = y2
    ),
    lineend = "round",
    linejoin = "round",
    color = "#ffcb05"
  )

