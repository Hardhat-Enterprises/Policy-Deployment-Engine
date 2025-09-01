package terraform.gcp.security.bigquery_connection.google_bigquery_connection.spark

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require Spark History Server to use an approved Dataproc cluster",
    "remedies": [
      "Set spark.spark_history_server_config.dataproc_cluster to a valid cluster in australia-southeast1 or australia-southeast2"
    ]
  },
  {
    "condition": "spark_history_server_config.dataproc_cluster must be in approved regions",
    "attribute_path": ["spark", 0, "spark_history_server_config", 0, "dataproc_cluster"],
    "policy_type": "whitelist",
    "values": [
      "projects/my-project/regions/australia-southeast1/clusters/approved-cluster",
      "projects/my-project/regions/australia-southeast2/clusters/approved-cluster"
    ]
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


