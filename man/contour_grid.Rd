% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contour_grid.R
\name{contour_grid}
\alias{contour_grid}
\title{Create the contour grid}
\usage{
contour_grid(seed = 117, grid_size, point_dist, z_method, z, z_span)
}
\arguments{
\item{seed}{Value or seed for the random number generator (numeric)}

\item{grid_size}{Maximum value for x and y (numeric)}

\item{point_dist}{Increment of the sequence for x and y (numeric)}

\item{z_method}{Distribution options for random generation for z values; options are rnorm, rpois, runif}

\item{z}{Values for creating the z values (numeric)}

\item{z_span}{Range of values for z (numeric), used as the additional parameter for the  random number distribution}
}
\value{
data frame with the x, y and z coordinates of the points
}
\description{
Create the contour grid
}
\examples{
# generates a 20 by 20 grid of points, with a distance of .25 between points,
# and the z values are generated using a normal distribution with a mean of 3 and SD of 1
grid_points = contour_grid(grid_size = 20, point_dist = .25, z_method = "rnorm", z = 3, z_span = 1)

}
