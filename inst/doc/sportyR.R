## ----vignette-options, include = FALSE----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "getting-started-",
  out.width = "100%",
  dpi = 600
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup, echo = FALSE------------------------------------------------------
library(sportyR)

## ----install-package-cran, eval = FALSE---------------------------------------
#  # Install released version from CRAN
#  install.packages("sportyR")

## ----install-package-github, eval = FALSE-------------------------------------
#  # Install development version from GitHub
#  devtools::install_github("sportsdataverse/sportyR")

## ----load-sportyR-------------------------------------------------------------
# Required to use package
library(sportyR)

## ----cani-example-1-----------------------------------------------------------
# Find out if you can plot a soccer pitch
cani_plot_sport("soccer")

## ----cani-example-2-----------------------------------------------------------
# See if a league comes pre-packaged with sportyR
cani_plot_league("PHF")

## ----example-basketball-court, dev = "png"------------------------------------
# Draw a regulation NBA basketball court
geom_basketball("nba")

