package terraform.gcp.security.datastream.private_connection.create_without_validation
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.private_connection.vars

conditions := [
  [
  {"situation_description": "Datastream Connection Profile should be configured to validated by checks.",
  "remedies": ["Set 'create_without_validation' to 'false' to enforce proper validation during resource creation."]},
  {
  "condition": "Checks if 'create_without_validation' is set to true.",
  "attribute_path": ["create_without_validation"],
  "values": [true],
  "policy_type": "blacklist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
