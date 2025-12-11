package terraform.gcp.security.api_gateway.google_api_gateway_api_config.labels
import data.terraform.helpers
import data.terraform.gcp.security.api_gateway.google_api_gateway_api_config.vars

# Security-oriented required labels
required_label_keys := [
  "environment",
  "owner",
  "sensitivity",
  "cost_center",
]

# Optional allow-lists for selected keys
allowed_values := {
  "environment" : ["production", "staging", "qa", "development"],
  "sensitivity": ["public", "internal", "confidential", "restricted"],
  "cost_center": ["FIN-001", "ENG-001", "SEC-001", "MKT-001", "HR-001", "IT-001"]
}

# Build the presence checks (non-empty)
presence_conditions := [
  [
    {
      "situation_description": sprintf("Missing or empty required security label: %s", [k]),
      "remedies": [sprintf("Set labels.%s to a non-empty value.", [k])]
    },
    {
      "condition": sprintf("labels.%s must be set", [k]),
      "attribute_path": ["labels", k],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ] |
    k := required_label_keys[_]
]

# Build value allow-list checks where defined
value_conditions := [
  [
    {
      "situation_description": sprintf("Invalid value for security label %s", [k]),
      "remedies": [sprintf("Set labels.%s to one of: %v", [k, allowed_values[k]])]
    },
    {
      "condition": sprintf("labels.%s must be in allow-list", [k]),
      "attribute_path": ["labels", k],
      "policy_type": "whitelist",
      "values": allowed_values[k]
    }
  ] |
    k := {"environment", "sensitivity", "cost_center"}[_]
]

conditions := array.concat(presence_conditions, value_conditions)

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details