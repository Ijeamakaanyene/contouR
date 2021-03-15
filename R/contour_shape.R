#' Turn the contour grid into a shape
#'
#' @param grid dataframe of x, y, and z points
#' @param radius radius of the shape
#' @param x_center x coordinate of the center of the shape
#' @param y_center y coordinate of the center of the shape
#' @param num_rings The number of rings around the contour shape.
#' This is optional, if you do not want rings leave default as null
#'
#' @return a list where the first item is a data frame with the
#' x, y and z coordinates of the points and the second items is a
#' data frame of the coordinates for the rings
#' @export
#'
#' @importFrom rlang .data
contour_shape = function(grid,
                         radius,
                         x_center,
                         y_center,
                         num_rings = NULL){

  if(!is.data.frame(grid)){stop("grid must be a dataframe")}
  if(!is.numeric(radius)){stop("radius must be numeric")}
  if(!is.numeric(x_center)){stop("x_center must be numeric")}
  if(!is.numeric(y_center)){stop("y_center must be numeric")}

  param = list(
    x_center = x_center,
    y_center = y_center,
    radius = radius,
    num_rings = num_rings)

  grid_shape = grid %>%
    create_shape(param) %>%
    identity()

  if(is.null(num_rings) == FALSE){
    rings = create_rings(param)

    return(list(grid_shape = grid_shape, rings = rings))
  }

  return(list(grid_shape = grid_shape))
}
