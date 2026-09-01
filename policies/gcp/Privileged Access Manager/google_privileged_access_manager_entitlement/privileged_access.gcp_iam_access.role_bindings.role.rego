package terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.privileged_access_gcp_iam_access_role_bindings_role
import data.terraform.helpers
import data.terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
