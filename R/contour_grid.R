#' Create the contour grid
#'
#' @param seed Value or seed for the random number generator (numeric)
#' @param grid_size Maximum value for x and y (numeric)
#' @param point_dist Increment of the sequence for x and y (numeric)
#' @param z_method Distribution options for random generation for z values; options are rnorm, rpois, runif
#' @param z Values for creating the z values (numeric)
#' @param z_span Range of values for z (numeric), used as the additional parameter for the  random number distribution
#'
#' @return data frame with the x, y and z coordinates of the points
#' @export
#'
#' @examples
#' # generates a 20 by 20 grid of points, with a distance of .25 between points,
#' # and the z values are generated using a normal distribution with a mean of 3 and SD of 1
#' grid_points = contour_grid(grid_size = 20, point_dist = .25, z_method = "rnorm", z = 3, z_span = 1)
#'
#' @importFrom rlang .data
contour_grid = function(seed = 117,
                        grid_size,
                        point_dist,
                        z_method,
                        z,
                        z_span){

  if(!is.numeric(grid_size)){stop("grid_size must be a numeric value")}
  if(!is.numeric(point_dist)){stop("point_dist must be a numeric value")}
  if(!is.numeric(z)){stop("z must be a numeric value")}
  if(!is.numeric(z_span)){stop("z_span must be a numeric value")}
  if(z_method == "rpois" & z < 0){stop("rpois method requires a z greater than zero")}
  if(!(z_method %in% c("rpois", "rnorm", "runif", "sample"))){stop("z_method must be selected from allowed distributions: rpois, rnorm, and runif, or sample")}


  # parameters defining contour grid
  param = list(
    seed = seed,
    grid_size = grid_size,
    point_dist = point_dist,
    z_method = z_method,
    z = z,
    z_span = z_span)

  # setting seed
  set.seed(param$seed)

  # Creating output grid
  grid_points = initiate_grid(param) %>%
    calculate_z(param)

  return(grid_points)
}





