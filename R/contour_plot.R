contour_plot = function(grid_shape,
                        background_col = "#2a3c4b",
                        line_col = "#3db573"){

  if(!is.data.frame(grid_shape)){stop("grid_shape must be a dataframe")}
  if(!is.character(background_col)){stop("background_col must be a character string")}
  if(!is.character(line_col)){stop("line_col must be a character string")}

  output_shape = ggplot2::ggplot(data = grid_shape) +
    ggplot2::geom_contour(ggplot2::aes(x = x, y = y, z = z),
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
