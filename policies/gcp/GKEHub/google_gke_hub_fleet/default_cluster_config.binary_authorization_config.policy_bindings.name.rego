package terraform.gcp.security.gke_hub.google_gke_hub_fleet.default_cluster_config_binary_authorization_config_policy_bindings_name
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_fleet.vars


conditions := [
  [
    {
      "situation_description": "Fleet default cluster config uses unapproved Binary Authorization policy binding",
      "remedies": ["Ensure policy_bindings.name matches approved organizational patterns"]
    },
    {
      "condition": "policy_bindings.name must match approved org pattern",
      "attribute_path": ["default_cluster_config",0,"binary_authorization_config",0,"policy_bindings",0,"name"],
      "values": ["projects/*/platforms/gke/policies/*", [["a","b","c","d"],["prod","test"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
