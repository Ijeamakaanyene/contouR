# contour grids

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
  if(!(z_method %in% c("rpois", "rnorm", "runif"))){stop("z_method must be selected from allowed distributions: rpois, rnorm, runif")}


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
    calculate_z(., param) %>%
    identity()

  return(grid_points)
}





