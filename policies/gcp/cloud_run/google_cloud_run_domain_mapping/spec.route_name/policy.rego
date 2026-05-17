package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.spec.route_name
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping routes traffic to an unapproved Cloud Run service",
      "remedies": [
        "Update route_name to an approved Cloud Run service",
        "Use the approved service name cloudrun-srv"
      ]
    },
    {
      "condition": "Route name must be an approved Cloud Run service",
      "attribute_path": ["spec", 0, "route_name"],
      "values": ["cloudrun-srv"],
      "policy_type": "whitelist"
    }
  ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


