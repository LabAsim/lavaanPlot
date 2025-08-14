model <- "mpg ~ cyl + disp + hp
          qsec ~ disp + hp + wt"

fit <- lavaan::sem(model, data = mtcars)

plot <- lavaanPlot2(
  model = fit
)
plot$x$diagram
plot_ref <- "digraph {\n\n\n\n\n  \"1\" [label = \"mpg\", shape = \"box\", group = \"obs\"] \n  \"2\" [label = \"qsec\", shape = \"box\", group = \"obs\"] \n  \"3\" [label = \"cyl\", shape = \"box\", group = \"obs\"] \n  \"4\" [label = \"disp\", shape = \"box\", group = \"obs\"] \n  \"5\" [label = \"hp\", shape = \"box\", group = \"obs\"] \n  \"6\" [label = \"wt\", shape = \"box\", group = \"obs\"] \n\"3\"->\"1\" [dir = \"forward\"] \n\"4\"->\"1\" [dir = \"forward\"] \n\"5\"->\"1\" [dir = \"forward\"] \n\"4\"->\"2\" [dir = \"forward\"] \n\"5\"->\"2\" [dir = \"forward\"] \n\"6\"->\"2\" [dir = \"forward\"] \n}"
test_that(desc = "Simple lavaanPlot2 plot", {
  expect_identical(plot$x$diagram, plot_ref)
})


HS.model <- " visual  =~ x1 + x2 + x3
textual =~ x4 + x5 + x6
speed   =~ x7 + x8 + x9
"

fit2 <- lavaan::cfa(HS.model, data = lavaan::HolzingerSwineford1939)
labels2 <- c(visual = "Visual Ability", textual = "Textual Ability", speed = "Speed Ability")
plot <- lavaanPlot2(
  fit2,
  include = "covs",
  labels = labels2,
  graph_options = list(
    label = "my first graph with signficance stars"
  ),
  node_options = list(fontname = "Helvetica"),
  edge_options = list(color = "grey"),
  stars = c("latent"),
  coef_labels = TRUE
)
plot$x$diagram
plot_ref <- "digraph {\n\ngraph [label = \"my first graph with signficance stars\"]\n\n\n\n  \"1\" [label = \"Visual Ability\", shape = \"oval\", group = \"latent\", fontname = \"Helvetica\"] \n  \"2\" [label = \"Textual Ability\", shape = \"oval\", group = \"latent\", fontname = \"Helvetica\"] \n  \"3\" [label = \"Speed Ability\", shape = \"oval\", group = \"latent\", fontname = \"Helvetica\"] \n  \"4\" [label = \"x1\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"5\" [label = \"x2\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"6\" [label = \"x3\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"7\" [label = \"x4\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"8\" [label = \"x5\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"9\" [label = \"x6\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"10\" [label = \"x7\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"11\" [label = \"x8\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"12\" [label = \"x9\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n\"4\"->\"1\" [dir = \"back\", label = \"1***\", color = \"grey\"] \n\"5\"->\"1\" [dir = \"back\", label = \"0.55***\", color = \"grey\"] \n\"6\"->\"1\" [dir = \"back\", label = \"0.73***\", color = \"grey\"] \n\"7\"->\"2\" [dir = \"back\", label = \"1***\", color = \"grey\"] \n\"8\"->\"2\" [dir = \"back\", label = \"1.11***\", color = \"grey\"] \n\"9\"->\"2\" [dir = \"back\", label = \"0.93***\", color = \"grey\"] \n\"10\"->\"3\" [dir = \"back\", label = \"1***\", color = \"grey\"] \n\"11\"->\"3\" [dir = \"back\", label = \"1.18***\", color = \"grey\"] \n\"12\"->\"3\" [dir = \"back\", label = \"1.08***\", color = \"grey\"] \n\"2\"->\"1\" [dir = \"both\", label = \"0.41\", color = \"grey\"] \n\"3\"->\"1\" [dir = \"both\", label = \"0.26\", color = \"grey\"] \n\"3\"->\"2\" [dir = \"both\", label = \"0.17\", color = \"grey\"] \n}"
test_that(desc = "lavaanPlot2 plot with covs and stars for latent", {
  expect_identical(plot$x$diagram, plot_ref)
})

plot <- lavaanPlot2(
  fit2,
  include = "all",
  labels = labels2,
  node_options = list(fontname = "Helvetica"),
  edge_options = list(color = "grey"),
  # stars = c("latent"),
  coef_labels = TRUE
)
plot$x$diagram
plot_ref <- "digraph {\n\n\n\n\n  \"1\" [label = \"Visual Ability\", shape = \"oval\", group = \"latent\", fontname = \"Helvetica\"] \n  \"2\" [label = \"Textual Ability\", shape = \"oval\", group = \"latent\", fontname = \"Helvetica\"] \n  \"3\" [label = \"Speed Ability\", shape = \"oval\", group = \"latent\", fontname = \"Helvetica\"] \n  \"4\" [label = \"x1\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"5\" [label = \"x2\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"6\" [label = \"x3\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"7\" [label = \"x4\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"8\" [label = \"x5\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"9\" [label = \"x6\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"10\" [label = \"x7\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"11\" [label = \"x8\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n  \"12\" [label = \"x9\", shape = \"box\", group = \"obs\", fontname = \"Helvetica\"] \n\"4\"->\"1\" [dir = \"back\", label = \"1\", color = \"grey\"] \n\"5\"->\"1\" [dir = \"back\", label = \"0.55\", color = \"grey\"] \n\"6\"->\"1\" [dir = \"back\", label = \"0.73\", color = \"grey\"] \n\"7\"->\"2\" [dir = \"back\", label = \"1\", color = \"grey\"] \n\"8\"->\"2\" [dir = \"back\", label = \"1.11\", color = \"grey\"] \n\"9\"->\"2\" [dir = \"back\", label = \"0.93\", color = \"grey\"] \n\"10\"->\"3\" [dir = \"back\", label = \"1\", color = \"grey\"] \n\"11\"->\"3\" [dir = \"back\", label = \"1.18\", color = \"grey\"] \n\"12\"->\"3\" [dir = \"back\", label = \"1.08\", color = \"grey\"] \n\"4\"->\"4\" [dir = \"both\", label = \"0.55\", color = \"grey\"] \n\"5\"->\"5\" [dir = \"both\", label = \"1.13\", color = \"grey\"] \n\"6\"->\"6\" [dir = \"both\", label = \"0.84\", color = \"grey\"] \n\"7\"->\"7\" [dir = \"both\", label = \"0.37\", color = \"grey\"] \n\"8\"->\"8\" [dir = \"both\", label = \"0.45\", color = \"grey\"] \n\"9\"->\"9\" [dir = \"both\", label = \"0.36\", color = \"grey\"] \n\"10\"->\"10\" [dir = \"both\", label = \"0.8\", color = \"grey\"] \n\"11\"->\"11\" [dir = \"both\", label = \"0.49\", color = \"grey\"] \n\"12\"->\"12\" [dir = \"both\", label = \"0.57\", color = \"grey\"] \n\"1\"->\"1\" [dir = \"both\", label = \"0.81\", color = \"grey\"] \n\"2\"->\"2\" [dir = \"both\", label = \"0.98\", color = \"grey\"] \n\"3\"->\"3\" [dir = \"both\", label = \"0.38\", color = \"grey\"] \n\"2\"->\"1\" [dir = \"both\", label = \"0.41\", color = \"grey\"] \n\"3\"->\"1\" [dir = \"both\", label = \"0.26\", color = \"grey\"] \n\"3\"->\"2\" [dir = \"both\", label = \"0.17\", color = \"grey\"] \n}"
test_that(desc = "lavaanPlot2 plot with covs and error vars", {
  expect_identical(plot$x$diagram, plot_ref)
})
