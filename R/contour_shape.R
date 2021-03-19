#' Turn the contour grid into a shape
#'
#' @param grid dataframe of x, y, and z points
#' @param radius radius of the shape
#' @param x_center x coordinate of the center of the shape
#' @param y_center y coordinate of the center of the shape
#' @param ring_system ring system options: halo or multiple.
#' This is optional, if you do not want rings leave as default
#' @param num_rings The number of rings around the contour shape,
#' if choosing multiple ring systems.
#' This is optional, if you do not want rings leave default as null
#'
#' @return a list where the first item is a data frame with the
#' x, y and z coordinates of the points and the second items is a
#' data frame of the coordinates for the rings (if ring system selected)
#' @export
#'
#' @importFrom rlang .data
contour_shape = function(grid,
                         radius,
                         x_center,
                         y_center,
                         ring_system = "none",
                         num_rings = 0){

  if(!is.data.frame(grid)){stop("grid must be a dataframe")}
  if(!is.numeric(radius)){stop("radius must be numeric")}
  if(!is.numeric(x_center)){stop("x_center must be numeric")}
  if(!is.numeric(y_center)){stop("y_center must be numeric")}
  if(!(ring_system %in% c("multiple", "halo", "none"))){
    stop("ring system must be selected from options: multiple, halo, or none")
  }

  # params needed in functions
  param = list(
    x_center = x_center,
    y_center = y_center,
    radius = radius,
    num_rings = num_rings)

  # turn input grid into a circle
  grid_shape = grid %>%
    create_shape(param)

  # add optional rings
  if(ring_system == "multiple"){
    rings = create_multiple_rings(param)

    return(list(grid_shape = grid_shape, rings = rings))

  } else if(ring_system == "halo"){
    rings = create_halo(param)

    return(list(grid_shape = grid_shape, rings = rings))
  }



  return(list(grid_shape = grid_shape))
}
