library(tidyverse)
library(tidymodels)
library(modeldata)
library(mlflow)
library(carrier)

data(attrition)

attrition <- as_tibble(attrition)

attrition
mlflow_ui()

#mlflow_create_experiment("attrition")

att_exp <- mlflow_get_experiment(name = "attrition")

att_split <- initial_split(attrition, prop = 0.7)

tmp_mtry <- 7
tmp_min_n <- 10

mlflow_start_run(experiment_id = att_exp$experiment_id)
mlflow_log_param("mtry", tmp_mtry)
mlflow_log_param("min_n", tmp_min_n)

rf_model <- rand_forest(mtry = tmp_mtry, min_n = tmp_min_n) %>% 
  set_engine("ranger") %>% 
  set_mode("classification")

mod <- rf_model %>% 
  fit(Attrition ~ ., data = training(att_split))

preds <- predict(mod, new_data = testing(att_split)) %>% 
  bind_cols(testing(att_split))

acc <- preds %>% 
  accuracy(truth = Attrition, estimate = .pred_class) %>% 
  pull(.estimate)

rec <- preds %>% 
  recall(truth = Attrition, estimate = .pred_class)%>% 
  pull(.estimate)

predictor <- crate(~parsnip::predict.model_fit(mod, .x), mod = mod)

predictor(testing(att_split))

mlflow_log_metric("accuracy", acc)
mlflow_log_metric("recall", rec)
mlflow_save_model(predictor, "models")

mlflow_log_model(predictor, "model")
mlflow_end_run()

mlflow_load_model("file:///home/florians/mlflow_workshop/mlruns/1/7e0518379a804e8a82052e416069381f/artifacts/model")

run_df <- mlflow_list_run_infos(experiment_id = 1) %>% pull(run_uuid) %>% 
  map_dfr(., ~(mlflow_get_metric_history("accuracy", run_id = .x) %>% mutate(run_id = .x))) %>% 
  left_join(mlflow_list_run_infos(experiment_id = 1), by = "run_id")

runid <- run_df %>% slice_max(value, n = 1) %>% pull(run_uuid)
art_uri <- run_df %>% slice_max(value, n = 1) %>% pull(artifact_uri)

loaded_mod <- mlflow_load_model(paste0("file://", art_uri, "/", mlflow_list_artifacts(run_id = runid) %>% pull(path))) 
mlflow_predict(loaded_mod, testing(att_split))
