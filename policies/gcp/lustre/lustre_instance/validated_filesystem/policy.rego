package terraform.gcp.security.lustre.lustre_instance.validated_filesystem

import data.terraform.gcp.helpers
import data.terraform.gcp.security.lustre.lustre_instance.vars

conditions := [
  [
    {
      "situation_description": "Only supported filename systems are supported.",
      "remedies": [
        "Rename the fie name system to fs1,fs2,fs3,fs4,fs5"
      ]
    },
    {
      "condition": "Invalid 'filesystem' name for Lustre instance.",
      "attribute_path": ["filesystem"],
      "values": [ "fs1","fs2","fs3","fs4","fs5"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
