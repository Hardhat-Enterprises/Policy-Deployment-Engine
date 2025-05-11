package terraform.gcp.security.secretmanager.secret.ttl_enforced
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing TTL (automatic expiration)",
      "remedies": ["Define a TTL like '3600s' to auto-expire secrets"]
    },
    {
      "condition": "ttl attribute should be present",
      "attribute_path": ["ttl"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
