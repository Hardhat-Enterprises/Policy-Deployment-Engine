package terraform.gcp.data_pipeline_pipeline

import data.terraform.gcp.data_pipeline_pipeline.naming_standard as naming

results = {
  "deny": [msg | msg := naming.deny[_]]
}
