library(glmnet)

data(iris)

is_setosa <- as.numeric(iris$Species == "setosa")
iris_x <- as.matrix(iris[c("Sepal.Length", "Sepal.Width",
                           "Petal.Length", "Petal.Width")])

fit <- glmnet(x = iris_x, y = is_setosa, family = "binomial")

summary(fit)
