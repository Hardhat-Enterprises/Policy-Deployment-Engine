package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.location
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars


conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping is deployed in an unapproved location",
      "remedies": [
        "Change the location to an approved region",
        "Use australia-southeast1 for this resource"
      ]
    },
    {
      "condition": "Location must be an approved region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]
   

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details



