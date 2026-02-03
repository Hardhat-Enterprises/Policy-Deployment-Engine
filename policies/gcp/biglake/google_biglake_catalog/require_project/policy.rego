package terraform.gcp.security.biglake.google_biglake_catalog.require_project 

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_catalog.vars

conditions := [
  [
    {
      "situation_description": "BigLake Catalog does not explicitly set the project",
      "remedies": [
        "Add project = var.project_id to the google_biglake_catalog resource"
      ]
    },
    {
      "condition": "Ensure project is explicitly set on the catalog",
      "attribute_path": ["project"],
      "values": ["*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
