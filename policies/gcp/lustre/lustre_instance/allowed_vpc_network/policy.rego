package terraform.gcp.security.lustre.lustre_instance.allowed_vpc_network

import data.terraform.gcp.helpers
import data.terraform.gcp.security.lustre.lustre_instance.vars

conditions := [
  [
    {
      "situation_description": "The 'network' attribute format: projects/{project_id}/global/networks/{network_name}.",
      "remedies": [
        "Set 'network' to a valid full VPC format projects/{project_id}/global/networks/{network_name}.",
        "Ensure the project ID and network name contain only allowed characters."
      ]
    },
    {
      "condition": "Invalid 'network' format for Lustre instance.",
      "attribute_path": ["network"],
      "values": ["projects/*/global/networks/*",[["fs1", "fs2"],["nw1", "nw2"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
