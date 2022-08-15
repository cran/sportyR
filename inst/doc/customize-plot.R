## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "customize-plot-",
  out.width = "100%",
  dpi = 600
)

## ----setup--------------------------------------------------------------------
library(sportyR)

## ----customize-plot-get-colors------------------------------------------------
# Find the colors for a college basketball court
cani_color_league_features("NCAA", "basketball")

## ----customizing-plots-illinois-court, dev = "png"----------------------------
geom_basketball(
  league = "ncaa",
  color_updates = list(
    offensive_half_court = "#e8e0d7",
    defensive_half_court = "#e8e0d7",
    court_apron = "#e84a27",
    two_point_range = c("#e8e0d7", "#ffffff66"),
    center_circle_fill = "#e8e0d7",
    painted_area = c("#e84a27", "#ffffff00"),
    free_throw_circle_fill = "#e8e0d7",
    sideline = "#13294b",
    endline = "#13294b",
    division_line = "#13294b",
    center_circle_outline = "#13294b",
    lane_boundary = c("#ffffff", "#ffffff00"),
    three_point_line = c("#13294b", "#ffffff"),
    free_throw_circle_outline = "#ffffff",
    lane_space_mark = "#ffffff",
    restricted_arc = "#13294b",
    backboard = "#13294b"
  )
)

## ----customizing-plots-blue-ncaaf-field, dev = "png"--------------------------
# Create a blue football field
geom_football(
  "ncaa",
  color_updates = list(
    field_apron = "#2e4597",
    field_border = "#2e4597",
    offensive_endzone = "#2e4597",
    defensive_endzone = "#2e4597",
    offensive_half = "#2e4597",
    defensive_half = "#2e4597",
    team_bench_area = "#2e4597"
  )
)

