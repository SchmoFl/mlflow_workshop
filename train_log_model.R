library(tidyverse)
library(tidymodels)
library(modeldata)
library(mlflow)

data(attrition)

attrition <- as_tibble(attrition)

attrition

mlflow_client()
mlflow_ui()
mlflow_create_experiment()
mlflow_run()

att_split <- initial_split(attrition, prop = 0.7)

rf_recipe <- recipe(Attrition ~ ., data = training(att_split)) %>% 
  step_zv(all_predictors()) %>% 
  step_nzv(all_predictors())

mlflow_log_param()

rf_model <- rand_forest(mtry = 7, min_n = 20) %>% 
  set_engine("ranger") %>% 
  set_mode("classification")

mod <- rf_model %>% 
  fit(Attrition ~ ., data = training(att_split))


preds <- predict(mod, new_data = testing(att_split)) %>% 
  bind_cols(testing(att_split))

preds %>% 
  conf_mat(truth = Attrition, estimate = .pred_class)

preds %>% 
  accuracy(truth = Attrition, estimate = .pred_class)

preds %>% 
  recall(truth = Attrition, estimate = .pred_class)

mlflow_log_metric()


 mlflow_end_run()