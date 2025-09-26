package terraform.gcp.security.cloud_storage.google_storage_bucket.allowed_location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
  [
    {
      "situation_description" : "Bucket should be within australia region",
      "remedies":[ 
        "Use Australian regions"
      ]
    },
    {
      "condition": "c1 location is either australia-southeast1 or australia-southeast2",
      "attribute_path" : ["location"], 
      "values" : ["AUSTRALIA-SOUTHEAST1", "AUSTRALIA-SOUTHEAST2"], 
      "policy_type" : "whitelist" 
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details