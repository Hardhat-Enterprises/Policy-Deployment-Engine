package terraform.gcp.security.alloydb.google_alloydb_instance_client_ip_logging

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance_client_ip_logging.vars

conditions := [
  [
    {"situation_description": "Instance must capture client IP addresses for Query Insights.",
     "remedies": ["Set query_insights_config.record_client_address to true."]},
    {
      "condition": "Client IP logging must be enabled.",
      "attribute_path": ["query_insights_config","record_client_address"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "Query Insights string length should be reasonably large.",
     "remedies": ["Set query_insights_config.query_string_length to at least 256."]},
    {
      "condition": "Minimum query string length.",
      "attribute_path": ["query_insights_config","query_string_length"],
      "values": [256,null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
