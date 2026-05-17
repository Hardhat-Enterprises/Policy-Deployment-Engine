package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.project
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping is deployed in an unapproved GCP project",
      "remedies": [
        "Use an approved GCP project",
        "Update the project field to the correct project ID"
      ]
    },
    {
      "condition": "Project must be an approved GCP project",
      "attribute_path": ["project"],
      "values": ["my-gcp-project"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


