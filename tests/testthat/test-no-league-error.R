# If no league is supplied, an error should be returned
test_that("Error when league is not supplied", {
  # Baseball
  expect_error(geom_baseball())

  # Basketball
  expect_error(geom_basketball())

  # Curling
  expect_error(geom_curling())

  # Football
  expect_error(geom_football())

  # Hockey
  expect_error(geom_hockey())

  # Lacrosse
  expect_error(geom_lacrosse())

  # Soccer
  expect_error(geom_soccer())

  # Tennis
  expect_error(geom_tennis())

  # Volleyball
  expect_error(geom_volleyball())
})
