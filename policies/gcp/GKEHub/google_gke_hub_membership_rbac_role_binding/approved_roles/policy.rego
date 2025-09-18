package terraform.gcp.security.gke_hub.google_gke_hub_membership_rbac_role_binding.approved_roles
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_membership_rbac_role_binding.vars

conditions := [
  [
    {
      "situation_description": "RBAC role grants more than least-privilege",
      "remedies": ["Change predefined_role to VIEW/EDIT/ANTHOS_SUPPORT; avoid ADMIN "]
    },
    {
      "condition": "role.predefined_role MUST be one of VIEW, EDIT, or ANTHOS_SUPPORT",
      "attribute_path": ["role",0,"predefined_role"],
      "values": ["VIEW","EDIT","ANTHOS_SUPPORT"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
