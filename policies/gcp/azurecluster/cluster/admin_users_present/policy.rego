package terraform.gcp.security.azurecluster.cluster.admin_users_present

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.vars as vars

conditions := [
  {
    "situation_description": "Only approved admin usernames should be assigned to clusters",
    "remedies": ["Use usernames like admin@example.com or ops@company.com"],
    "condition": "C1",
    "attribute_path": ["authorization", 0, "admin_users", 0, "username"],
    "values": ["admin@example.com", "ops@company.com", "cloud.admin@secure.org"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
