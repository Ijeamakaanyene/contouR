#' Turn the contour grid into a shape
#'
#' @param grid dataframe of x, y, and z points
#' @param radius radius of the shape
#' @param x_center x coordinate of the center of the shape
#' @param y_center y coordinate of the center of the shape
#'
#' @return data frame with the x, y and z coordinates of the points
#' @export
#'
#' @importFrom rlang .data
contour_shape = function(grid,
                         radius,
                         x_center,
                         y_center){

  if(!is.data.frame(grid)){stop("grid must be a dataframe")}
  if(!is.numeric(radius)){stop("radius must be numeric")}
  if(!is.numeric(x_center)){stop("x_center must be numeric")}
  if(!is.numeric(y_center)){stop("y_center must be numeric")}

  param = list(
    x_center = x_center,
    y_center = y_center,
    radius = radius)

  grid_shape = grid %>%
    create_shape(param) %>%
    identity()

  return(grid_shape)
}
