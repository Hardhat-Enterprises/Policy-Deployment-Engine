package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.metadata_namespace
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping namespace is not approved",
      "remedies": [
        "Set namespace to the correct project ID or project number",
        "Ensure the namespace matches the expected Cloud Run project namespace"
      ]
    },
    {
      "condition": "Namespace must match the approved project namespace",
      "attribute_path": ["metadata", 0, "namespace"],
      "values": ["my-project-name"],
      "policy_type": "whitelist"
    }
  ]
]
    


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


