# calculate the distance between points
distance_formula = function(x2, x1, y2, y1){
  dist = sqrt((x2 - x1)^2 + (y2 - y1)^2)

  return(dist)
}

# initiate the grid of points for contours
initiate_grid = function(param){
  grid_points = expand.grid(
    x = seq(1, param$grid_size, by = param$point_dist),
    y = seq(1, param$grid_size, by = param$point_dist))

  return(grid_points)
}

# calculate z
use_z_method = function(param){
  if(param$z_method == "rnorm"){
    stat_calc = stats::rnorm(
      dplyr::n(),
      mean = param$z,
      sd = param$z_span)

  } else if(param$z_method == "rpois"){
    stat_calc = stats::rpois(
      dplyr::n(),
      lambda = param$z)

  } else if(param$z_method == "runif"){
    stat_calc = stats::runif(
      dplyr::n(),
      min = param$z - param$z_span,
      max = param$z + param$z_span
    )
  }
  return(stat_calc)
}


calculate_z = function(grid_points, param){

  grid_points = grid_points %>%
    dplyr::mutate(z = use_z_method(param))

  return(grid_points)
}

# modify the output grid to be in a shape
create_shape = function(grid_points, param){
  grid_points = grid_points %>%
    dplyr::mutate(distance = distance_formula(param$x_center, x, param$y_center, y)) %>%
    dplyr::filter(distance < param$radius)

  return(grid_points)
}





