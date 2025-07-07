#' Generates edge styles
#'
#' @param pvals a vector of p values
add_edge_style <- function(pvals) {
  if (pvals <= 0.05) {
    line_style <- ""
  } else {
    line_style <- " style = dashed "
  }
  return(line_style)
}

#' Creates  edge styles
#'
#' @param pvals a vector of p values
#' @param edge_styles  boolean, sets edge styles based on p-values
create_edge_styles <- function(pvals, edge_styles = F) {
  if (edge_styles == T) {
    edge_styles <- unlist(lapply(X = pvals, FUN = add_edge_style))
  } else {
    edge_styles <- rep(x = "", times = length(pvals))
  }
  return(edge_styles)
}

#' Generates standard significance stars
#'
#' @param pvals a vector of p values
sig_stars <- function(pval) {
  if (pval <= 0.001) {
    star <- "***"
  } else if (pval <= 0.01) {
    star <- "**"
  } else if (pval <= 0.05) {
    star <- "*"
  } else {
    star <- ""
  }
  return(star)
}
