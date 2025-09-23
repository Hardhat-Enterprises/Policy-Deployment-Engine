package terraform.gcp.security.dataplex.google_dataplex_asset.json_options

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

conditions := [
  [
    {
      "situation_description": "Dataplex Asset must use secure JSON encoding (UTF-8) and allow type inference",
      "remedies": ["Set encoding to UTF-8", "Ensure disable_type_inference = false"]
    },
    {
      "condition": "Check if json_options.encoding is UTF-8",
      "attribute_path": ["discovery_spec", 0, "json_options", 0, "encoding"],
      "values": ["UTF-8"],
      "policy_type": "whitelist"
    },
    {
      "condition": "Check if json_options.disable_type_inference is false",
      "attribute_path": ["discovery_spec", 0, "json_options", 0, "disable_type_inference"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
