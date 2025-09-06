package terraform.gcp.security.alloydb.google_alloydb_instance.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

# Conditions for security/governance labels on AlloyDB instances
conditions := [
  # S1: owner label must be present and non-empty
  [
    {
      "situation_description": "Missing or empty 'owner' label on the instance.",
      "remedies": [
        "Add labels.owner with the responsible team's email/alias."
      ]
    },
    {
      "condition": "'owner' label must exist",
      "attribute_path": ["labels", "owner"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ],

  # S2: data_classification must be present and one of the approved values
  [
    {
      "situation_description": "Missing or invalid 'data_classification' label.",
      "remedies": [
        "Set labels.data_classification to one of: public, internal, confidential, restricted."
      ]
    },
    {
      "condition": "'data_classification' must be approved value",
      "attribute_path": ["labels", "data_classification"],
      "policy_type": "blacklist",
      "values": [null, "", "unknown", "n/a"]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
