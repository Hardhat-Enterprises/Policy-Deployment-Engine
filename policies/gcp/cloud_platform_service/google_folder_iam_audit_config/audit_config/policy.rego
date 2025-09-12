package terraform.gcp.security.cloud_platform_service.google_folder_iam_audit_config.audit_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_audit_config.vars


conditions := [
  # s1: whitelist required log types. e.g., admin-read, data-read, data-write
  [
  {"situation_description": "Audit logging must be enabled for all services",
   "remedies": ["Enable ADMIN_READ, DATA_READ, DATA_WRITE logs"]},
  {
    "condition": "Whitelist required audit log types",
    "attribute_path": ["audit_log_config",0,"log_type",0, "constant_value"],
    "values": ["ADMIN_READ", "DATA_READ", "DATA_WRITE"],
    "policy_type": "whitelist"
  }
],

# s2: blacklist exemptions. e.g., blocked expemted members
[
  {"situation_description": "Audit logs must not exempt members",
   "remedies": ["Remove exempted_members from audit config"]},
  {
    "condition": "Block exempted members in audit logging",
    "attribute_path": ["audit_log_config",0,"exempted_members",0],
    "values": ["*", [["user:*", "group:.*", "serviceAccount:.*"]]],  
    "policy_type": "pattern blacklist"
  }
]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
