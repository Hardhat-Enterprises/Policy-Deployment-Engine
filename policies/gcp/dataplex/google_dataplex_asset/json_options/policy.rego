package terraform.gcp.security.dataplex.google_dataplex_asset.json_options

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

# Policy: Only non-compliant if BOTH conditions are true:
#   - encoding is UTF-16
#   - json_options.disable is true
conditions := [
  [
    {
      "situation_description": "Dataplex Asset must not use UTF-16 with JSON disable enabled",
      "remedies": [
        "Use UTF-8 encoding instead of UTF-16",
        "Or disable must be set to false"
      ]
    },
    {
      "condition": "Check if encoding is UTF-16",
      "attribute_path": ["discovery_spec", 0, "json_options", 0, "encoding"],
      "values": ["UTF-16"],
      "policy_type": "whitelist"
    },
    {
      "condition": "Check if json_options.disable is true",
      "attribute_path": ["discovery_spec", 0, "json_options", 0, "disable"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
