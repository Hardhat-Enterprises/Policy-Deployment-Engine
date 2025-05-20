package terraform.gcp.security.datastream.connection_profile.forward_ssh_connectivity

import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.connection_profile.vars

conditions := [
  [
  {"situation_description": "Password should not be hardcoded in Forward SSH Connectivity",
  "remedies": ["Use secret manager references instead of hardcoded values","Avoid setting plain text passwords"]},
  {
  "condition": "Checks if the password is hardcoded under forward_ssh_connectivity",
  "attribute_path": ["forward_ssh_connectivity", 0, "password"],
  "values": ["/secrets/ssh/ssh_password.rsa"],
  "policy_type": "whitelist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details