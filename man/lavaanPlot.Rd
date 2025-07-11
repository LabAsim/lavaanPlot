% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lavaanPlot.R
\name{lavaanPlot}
\alias{lavaanPlot}
\title{Plots lavaan path model with DiagrammeR and graphviz}
\usage{
lavaanPlot(
  model,
  name = "plot",
  labels = NULL,
  graph_options = list(overlap = "true", fontsize = "10"),
  node_options = list(shape = "box"),
  edge_options = list(color = "black"),
  coefs = FALSE,
  sig = 1,
  stand = FALSE,
  covs = FALSE,
  stars = NULL,
  digits = 2,
  conf.int = F,
  edge_styles = F,
  ...
)
}
\arguments{
\item{model}{A model fit object of class lavaan.}

\item{name}{A string of the name of the plot.}

\item{labels}{An optional named list of variable labels fit object of class lavaan.}

\item{graph_options}{A named list of graph options for Diagrammer syntax. See for options https://graphviz.org/docs/graph/}

\item{node_options}{A named list of node options for Diagrammer syntax. See for options https://graphviz.org/docs/nodes/}

\item{edge_options}{A named list of edge options for Diagrammer syntax. See for options https://graphviz.org/docs/edges/}

\item{coefs}{whether or not to include significant path coefficient values in diagram}

\item{sig}{significance level for determining what significant paths are}

\item{stand}{Should the coefficients being used be standardized coefficients}

\item{covs}{Should model covariances be included in the diagram}

\item{stars}{a character vector indicating which parameters should include significance stars be included for regression paths, latent paths, or covariances. Include which of the 3 you want ("regress", "latent", "covs"), default is none.}

\item{digits}{A number indicating the desired number of digits for the coefficient values in the plot}

\item{conf.int}{whether or not to include confidence intervals of path coefficients}

\item{edge_styles}{Whether or not to depict non-significant coefficients with dashed paths}

\item{...}{Additional arguments to be called to \code{buildCall} and \code{buildPaths}}
}
\value{
A Diagrammer plot of the path diagram for \code{model}
}
\description{
Plots lavaan path model with DiagrammeR and graphviz
}
\examples{
library(lavaan)
model <- "mpg ~ cyl + disp + hp
          qsec ~ disp + hp + wt"
fit <- sem(model, data = mtcars)
lavaanPlot(
  model = fit, node_options = list(shape = "box", fontname = "Helvetica"),
  edge_options = list(color = "grey"), coefs = FALSE
)
}
