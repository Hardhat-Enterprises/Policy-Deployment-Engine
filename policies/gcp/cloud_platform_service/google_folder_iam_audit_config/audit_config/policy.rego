package terraform.gcp.security.cloud_platform_service.google_folder_iam_audit_config.audit_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_audit_config.vars


conditions := [
  # whitelist required log types. e.g., admin-read, data-read, data-write
  [
    {"situation_description": "Audit logging must include ADMIN_READ",
     "remedies": ["Enable ADMIN_READ log"]},
    {
      "condition": "Must include ADMIN_READ",
      "attribute_path": ["audit_log_config",0,"log_type"],
      "values": ["ADMIN_READ"],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "Audit logging must include DATA_READ",
     "remedies": ["Enable DATA_READ log"]},
    {
      "condition": "Must include DATA_READ",
      "attribute_path": ["audit_log_config",1,"log_type"],
      "values": ["DATA_READ"],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "Audit logging must include DATA_WRITE",
     "remedies": ["Enable DATA_WRITE log"]},
    {
      "condition": "Must include DATA_WRITE",
      "attribute_path": ["audit_log_config",2,"log_type"],
      "values": ["DATA_WRITE"],
      "policy_type": "whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
