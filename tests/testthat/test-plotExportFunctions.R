model <- "mpg ~ cyl + disp + hp
qsec ~ disp + hp + wt"

fit <- lavaan::sem(model, data = mtcars)

plot <- lavaanPlot(
  model = fit,
  node_options = list(shape = "box", fontname = "Helvetica"),
  edge_options = list(color = "grey"),
  coefs = T,
  conf.int = T,
  digits = 2
)

test_that("plot", {
  filename <- file.path(getwd(), "test.png")
  save_png(plot = plot, filename = filename)
  expect_equal(file.exists(filename), T)
  file.remove(filename)
})

test_that("plot", {
  filename <- file.path(getwd(), "test.png")
  save_png(plot = plot, filename = filename, width = 100, height = 100)
  expect_equal(file.exists(filename), T)
  file.remove(filename)
})


test_that("plot", {
  filename <- file.path(getwd(), "test.pdf")
  embed_plot_pdf(plot = plot, filename = filename, width = 100, height = 100)
  expect_equal(file.exists(filename), T)
  file.remove(filename)
})
