package terraform.gcp.security.datastream.connection_profile.create_validate
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.connection_profile.vars

conditions := [
  [
    {
      "situation_description": "'create_without_validation' is set to true, which skips validating the connection profile during creation.",
      "remedies": [
        "Set 'create_without_validation' to false to ensure the connection is validated during creation."
      ]
    },
    {
      "condition": "Checks if 'create_without_validation' is incorrectly set to true.",
      "attribute_path": ["create_without_validation"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]
summary := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
