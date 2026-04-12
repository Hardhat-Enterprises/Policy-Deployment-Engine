package terraform.gcp.security.cloud_identity.google_cloud_identity_group.display_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.vars

# (display_name) – exact matches only
conditions := [
  [
    {"situation_description": "Avoid placeholder display names for Cloud Identity groups.",
     "remedies": ["Use a descriptive production group name instead of generic placeholders."]},
    {"condition": "Placeholder display_name",
    "attribute_path": ["display_name"],
     "values": ["nc", "test", "demo", "sample"],
     "policy_type": "blacklist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details