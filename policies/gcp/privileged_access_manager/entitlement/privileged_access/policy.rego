package terraform.gcp.security.privileged_access_manager.entitlement.privileged_access
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
  [
    {"situation_description": "Correct Privileged access role",
     "remedies": ["Change to roles/privilegedaccessmanager.admin"]},
    {
      "condition": "Check if role binding is using overly privileged roles",
      "attribute_path": ["privileged_access", 0, "gcp_iam_access", 0, "role_bindings", 0, "role"],
      "values": ["roles/privilegedaccessmanager.admin"],
      "policy_type": "whitelist"
    }
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details