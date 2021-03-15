library(xgboost)

data(iris)

is_setosa <- as.numeric(iris$Species == "setosa")
iris_x <- as.matrix(iris[c("Sepal.Length", "Sepal.Width",
                           "Petal.Length", "Petal.Width")])
iris_data <- xgb.DMatrix(data = iris_x, label = is_setosa)

param <- list(max_depth = 3, eta = 1, nthread = 1,
              objective = "binary:logistic", eval_metric = "auc")

fit <- xgboost(params = param, data = iris_data, nrounds = 10)

print(fit)
