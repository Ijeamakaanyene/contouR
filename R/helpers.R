# Internal functions operating the contour_*() functions


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
  } else if(param$z_method == "sample"){
    stat_calc = sample(
      x = param$z:(param$z + param$z_span),
      size = dplyr::n(),
      replace = TRUE)
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
    dplyr::mutate(distance = distance_formula(param$x_center, .data$x, param$y_center, .data$y)) %>%
    dplyr::filter(.data$distance < param$radius) %>%
    dplyr::select(-.data$distance)

  return(grid_points)
}

# add rings to the shape
create_multiple_rings = function(param){
  parts = 10
  val = pi/parts
  start_ops = val * 1:parts
  ring_system = list()

  for(i in 1:param$num_rings){
    start = sample(start_ops, 1)
    end = sample(1:(parts/2), size = 1)
    size = sample(param$radius:(param$radius + param$num_rings), size = 1)

    len = seq(start, start*end, length.out = 100)

    ring_system[[i]] = dplyr::tibble(
      x = (sin(len)*size) + param$x_center,
      y = (cos(len)*size) + param$y_center,
      group = LETTERS[i],
      type = "multiple"
    )
  }

  return(dplyr::bind_rows(ring_system))
}

create_halo = function(param){
  len = seq(0, 2*pi, length.out = 500)

  ring_system = dplyr::tibble(
    x = (cos(len)*(param$radius + 4)) + param$x_center,
    y = (sin(len)*(param$radius + 4)) + param$y_center,
    group = LETTERS[1],
    type = "halo"
  )

  return(ring_system)
}






