package terraform.gcp.security.biglake.google_biglake_table.storage_location_prefix

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_table.vars

conditions := [
  [
    {
      "situation_description": "BigLake table is configured to use a non-approved Cloud Storage bucket.",
      "remedies": [
        "Configure the table to use an approved private Cloud Storage bucket."
      ]
    },
    {
      "condition": "Check that the table storage location uses an approved bucket prefix.",
      "attribute_path": ["hive_options", "storage_descriptor", "location_uri"],
      "values": [
        "gs://secure-",
        "gs://private-"
      ],
      "policy_type": "prefix"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
