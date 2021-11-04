library(ggseg)
library(ggseg3d)
library(ggplot2)

# ggseg ----
context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("brodmann", package = "ggsegBrodmann")), 39)

  expect_error(brain_pal("brodmann"), "not a valid")

  expect_true(all(brain_regions(brodmann) %in% names(brain_pal("brodmann", package = "ggsegBrodmann"))))
})

context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(brodmann))

})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = brodmann),c("gg","ggplot"))

  expect_is(ggseg(atlas = brodmann, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = brodmann, mapping = aes(fill = region)) +
              scale_fill_brain("brodmann", package = "ggsegBrodmann"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = brodmann, mapping = aes(fill = region)) +
              scale_fill_brain("brodmann", package = "ggsegBrodmann"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = brodmann, mapping=aes(fill=region), adapt_scales = FALSE ),c("gg","ggplot"))

})


# ggseg3d ----
context("test-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=brodmann_3d),
    c("plotly", "htmlwidget")
  )
})



context("test-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(brodmann_3d))

})
