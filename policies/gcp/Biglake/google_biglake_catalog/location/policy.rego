package terraform.gcp.security.biglake.google_biglake_catalog.location

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_catalog.vars

conditions := [
  [
    {
      "situation_description": "BigLake Catalog is created in an unapproved location",
      "remedies": [
        "Change the location to an approved value"
      ]
    },
    {
      "condition": "Allow only approved catalog locations",
      "attribute_path": ["location"],
      "values": ["AU"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
