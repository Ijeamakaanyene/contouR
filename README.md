
<!-- README.md is generated from README.Rmd. Please edit that file -->

# contouR

<!-- badges: start -->

<!-- badges: end -->

contouR is a package that is a wraparound for `ggplot2::geom_contour()`
to use for generative art. `geom_contour()` allows one to visualize 3D
surfaces in 2D by using x, y and z coordinates. To change it up from the
typical contour plot, there are three different distributions used to
generate the z values: `rnorm()`, `runif()`, and `rpois()`.

## Installation

You can install the current verion of contouR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Ijeamakaanyene/contouR")
```

## Example

``` r
library(contouR)


contour_grid(grid_size = 15, point_dist = .5, 
             z_method = "runif", z = 5, z_span = 3) %>%
  contour_shape(radius = 5.2, 
                x_center = 7, y_center = 7) %>%
  contour_plot()
```

<img src="man/figures/README-example-1.png" width="100%" />
