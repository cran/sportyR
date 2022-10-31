## ----vignette-options, include = FALSE----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "animating-tracking-data-",
  out.width = "100%",
  dpi = 600
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup--------------------------------------------------------------------
library(sportyR)
library(ggplot2)
library(gganimate)

## ----bdb-example-read-data----------------------------------------------------
# Load the play data
example_nfl_play <- data.table::fread(
  glue::glue(
    "https://raw.githubusercontent.com/sportsdataverse/sportyR/",
    "main/data-raw/example-pbp-data.csv"
  )
)

# Convert to data frame
example_nfl_play <- as.data.frame(example_nfl_play)

## ----bdb-example-prep-data----------------------------------------------------
# Prep data for plotting
example_nfl_play[example_nfl_play["team"] == "home", "color"] <- "#c83803"
example_nfl_play[example_nfl_play["team"] == "away", "color"] <- "#ffb612"
example_nfl_play[example_nfl_play["team"] == "football", "color"] <- "#624a2e"

## ----bdb-example-draw-field, eval = FALSE-------------------------------------
#  # Create the field
#  nfl_field <- geom_football("nfl", x_trans = 60, y_trans = 26.6667)
#  
#  # Display the field
#  nfl_field

## ----bdb-example-animate-play, eval = FALSE-----------------------------------
#  # Add the points on the field
#  play_anim <- nfl_field +
#    geom_point(
#      data = example_nfl_play,
#      aes(x, y),
#      color = example_nfl_play$color
#    ) +
#    transition_time(example_nfl_play$frameId)
#  
#  # Show the animation
#  play_anim

