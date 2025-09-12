package terraform.gcp.security.cloud_platform_service.google_organization_iam_custom_role.stage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_organization_iam_custom_role.vars

conditions := [
    [
  {"situation_description": "Custom roles must not include risky permissions.",
   "remedies": ["Remove admin-level permissions such as iam.roles.delete or resourcemanager.*"]},
  {
    "condition": "Blacklist risky permissions",
    "attribute_path": ["permissions",0],
    "values": ["iam.roles.delete", "resourcemanager.*"],
    "policy_type": "blacklist"
  }
],

[
  {"situation_description": "Custom roles must not use deprecated or alpha stages.",
   "remedies": ["Use stage = GA or DISABLED for safe lifecycle states"]},
  {
    "condition": "Enforce stable stages only",
    "attribute_path": ["stage"],
    "values": ["GA", "DISABLED"],
    "policy_type": "whitelist"
  }
]


]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

