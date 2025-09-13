package terraform.gcp.security.privileged_access_manager.entitlement.parent

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
  [
    {
      "situation_description": "Parent must be a valid project, organization, or folder identifier",
      "remedies": [
        "Use format: projects/{project-id|project-number}, organizations/{organization-number}, or folders/{folder-number}"
      ]
    },
    {
      "condition": "Check if parent matches allowed GCP resource patterns",
      "attribute_path": ["parent"],
      "values": [
        "parent",
        [
          ["^projects/[a-z0-9\\-]+$"], 
          ["^folders/[0-9]+$"], 
          ["^organizations/[0-9]+$"]
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details