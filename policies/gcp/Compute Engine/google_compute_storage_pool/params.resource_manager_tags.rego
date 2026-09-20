package terraform.gcp.security.compute_engine.google_compute_storage_pool.params_resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars

conditions := [
  [
    {
      "situation_description": "Storage Pool does not have the required Resource Manager security tag.",
      "remedies": [
        "Bind the approved Resource Manager security tag to the Storage Pool."
      ]
    },
    {
      "condition": "The Resource Manager security tag must have the approved value.",
      "attribute_path": [
        "params",
        0,
        "resource_manager_tags",
        "pde-project-vindya/security"
      ],
      "values": ["required"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details