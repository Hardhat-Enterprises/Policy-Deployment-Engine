package terraform.gcp.security.privileged_access_manager.entitlement.privileged_access
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
  [
    {"situation_description": "Privileged access role is too powerful",
     "remedies": ["Use less privileged roles like roles/viewer or roles/storage.objectViewer"]},
    {
      "condition": "Check if role binding is using overly privileged roles",
      "attribute_path": ["privileged_access",0,"gcp_iam_access","role_bindings",0,"role"],
      "values": ["roles/owner","roles/editor","roles/admin"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Maximum request duration exceeds allowed limit",
     "remedies": ["Set max_request_duration to 3600s or less"]},
    {
      "condition": "Ensure max_request_duration is less than or equal to 3600s",
      "attribute_path": ["max_request_duration"],
      "values": [null,3600],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
