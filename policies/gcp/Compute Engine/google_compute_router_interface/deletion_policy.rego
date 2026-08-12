package terraform.gcp.security.compute_engine.google_compute_router_interface.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_router_interface.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Router interface deletion_policy is not set to allow normal deletion.",
      "remedies": [
        "Set deletion_policy to DELETE so Terraform can manage and remove the resource normally.",
      ],
    },
    {
      "condition": "deletion_policy must be DELETE.",
      "attribute_path": ["deletion_policy"],
      "values": [
        "DELETE",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
