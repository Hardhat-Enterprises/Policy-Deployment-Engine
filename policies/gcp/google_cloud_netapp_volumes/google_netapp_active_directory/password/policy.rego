package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.password

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {"situation_description": "Password must be strong and stored securely",
     "remedies": [
       "Use a sensitive variable (e.g., var.ad_password).",
       "Password ≥14 chars, includes upper/lower/digit/special, and no spaces."
     ]},
    {
      "condition": "length ≥ 14",
      "attribute_path": ["password"],
      "values": ["^.{14,128}$"],
      "policy_type": "pattern whitelist"
    },
    {
      "condition": "contains uppercase",
      "attribute_path": ["password"],
      "values": [".*[A-Z].*"],
      "policy_type": "pattern whitelist"
    },
    {
      "condition": "contains lowercase",
      "attribute_path": ["password"],
      "values": [".*[a-z].*"],
      "policy_type": "pattern whitelist"
    },
    {
      "condition": "contains digit",
      "attribute_path": ["password"],
      "values": [".*[0-9].*"],
      "policy_type": "pattern whitelist"
    },
    {
      "condition": "contains special character",
      "attribute_path": ["password"],
      "values": [".*[^A-Za-z0-9].*"],
      "policy_type": "pattern whitelist"
    },
    {
      "condition": "no whitespace",
      "attribute_path": ["password"],
      "values": ["\\s"],
      "policy_type": "pattern blacklist"
    },
    {
      "condition": "not a common weak password",
      "attribute_path": ["password"],
      "values": ["(?i)^(pass|password|admin|123456|qwerty|letmein)$"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
