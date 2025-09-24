package terraform.gcp.security.bigquery_connection.google_bigquery_connection.spark.dataproc_cluster
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars
#
conditions := [[
  {
    "situation_description": "Require Spark History Server cluster to be approved",
    "remedies": [
      "Set spark.spark_history_server_config.dataproc_cluster to the approved cluster"
    ]
  },
  {
    "condition": "dataproc_cluster must be approved",
    "attribute_path": ["spark", 0, "spark_history_server_config", 0, "dataproc_cluster"],
    "values": [
      "projects/my-project-c/regions/*/clusters/approved-cluster",
      ["australia-southeast2", "australia-southeast1"]
    ],
    "policy_type": "pattern whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
