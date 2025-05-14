package terraform.gcp.security.azureclient.client.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.vars as vars

conditions := [
  {
    "situation_description": "Blocked Azure locations must not be used",
    "remedies": ["Avoid using blacklisted locations such as china-north1 or asia-east2"],
    "condition": "C1",
    "attribute_path": ["location"],
    "values": ["china-north1", "asia-east2"],
    "policy_type": "blacklist"
  },
  {
    "situation_description": "Azure clients must be deployed in approved regions",
    "remedies": ["Use locations such as australia-southeast1 or us-central1"],
    "condition": "C2",
    "attribute_path": ["location"],
    "values": ["australia-southeast1", "us-central1"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
