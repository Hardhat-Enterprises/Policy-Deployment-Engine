package terraform.gcp.security.cloud_platform_service.google_folder_organization_policy.constraint
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_organization_policy.vars

conditions := [
  # 1. List Policy – restrict risky services
  [
    {"situation_description": "Certain APIs or services must not be enabled in this folder.",
     "remedies": ["Deny risky services using list_policy.deny.values (e.g., cloudresourcemanager.googleapis.com)."]},
    {
      "condition": "Deny risky services",
      "attribute_path": ["list_policy",0,"deny",0,"values",0],
      "values": ["cloudresourcemanager.googleapis.com"],
      "policy_type": "blacklist"
    }
  ],

  # 2. Restore Policy – prevent resetting constraints to defaults
  [
    {"situation_description": "Restoring default policies may weaken constraints.",
     "remedies": ["Do not set restore_policy.default = true."]},
    {
      "condition": "Block restore to default",
      "attribute_path": ["restore_policy",0,"default"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
  ,

  # 3. Block inherit_from_parent = true in list_policy
  [
  {
    "situation_description": "List policies must not inherit from parent folder.",
    "remedies": ["Set list_policy.inherit_from_parent = false to avoid inherited risk."]
  },
  {
    "condition": "Block inheritance from parent",
    "attribute_path": ["list_policy", 0, "inherit_from_parent"],
    "values": [true],
    "policy_type": "blacklist"
  }
]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
