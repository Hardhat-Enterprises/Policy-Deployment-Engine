package terraform.gcp.security.biglake.google_biglake_table.type

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_table.vars

conditions := [
  [
    {
      "situation_description": "BigLake table is created with a non-approved table type.",
      "remedies": [
        "Use an approved BigLake table type only."
      ]
    },
    {
      "condition": "Check that the table type is within the approved allowlist.",
      "attribute_path": ["type"],
      "values": [
        "HIVE",
        "ICEBERG"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
