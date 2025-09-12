package terraform.gcp.security.dataproc_metastore.federation.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.federation.vars

conditions := [
  [
    {
      "situation_description": "Location must reside in Australian regions",
      "remedies": ["Set location to australia-southeast1 or australia-southeast2"]
    },
    {
      "condition": "Checks location is in Australia",
      "attribute_path": ["location"],   
      "values": ["australia-southeast2", "australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
