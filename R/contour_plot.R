#' Plot the contour grid
#'
#' @param grid_shape a dataframe of x, y, and z points
#' @param background_col a character string used for the background color of the plot
#' @param line_col a character string used for the line colors of your plot
#'
#' @return a ggplot2 object with some default parameters of line size of 0.25,
#' linejoin is round, and uses theme_void() to remove extra elements
#'
#' @export
#' @importFrom rlang .data
contour_plot = function(grid_shape,
                        background_col = "#2a3c4b",
                        line_col = "#e9ebed"){

  if(!is.data.frame(grid_shape)){stop("grid_shape must be a dataframe")}
  if(!is.character(background_col)){stop("background_col must be a character string")}
  if(!is.character(line_col)){stop("line_col must be a character string")}

  output_shape = ggplot2::ggplot(data = grid_shape) +
    ggplot2::geom_contour(ggplot2::aes(x = .data$x, y = .data$y, z = .data$z),
                          size = .25,
                          linejoin = "round",
                          color = line_col) +
    ggplot2::coord_equal(expand = c(0)) +
    ggplot2::theme_void() +
    ggplot2::theme(panel.background =
                     ggplot2::element_rect(fill = background_col,
                                           color = background_col),
                   plot.background =
                     ggplot2::element_rect(fill = background_col,
                                           color = background_col))

  return(output_shape)


}
