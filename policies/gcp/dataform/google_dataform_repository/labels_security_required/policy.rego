package terraform.gcp.security.dataform.google_dataform_repository.labels_security_required

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

# Security-oriented required labels
required_label_keys := [
  "security_contact",
  "data_classification",
  "business_criticality",
  "compliance_regime",
]

# Optional allow-lists for selected keys
allowed_values := {
  "data_classification": ["public", "internal", "confidential", "restricted"],
  "business_criticality": ["low", "medium", "high"],
  "compliance_regime": ["none", "hipaa", "pci", "sox", "gdpr", "iso27001"],
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
    k := {"data_classification", "business_criticality", "compliance_regime"}[_]
]

conditions := array.concat(presence_conditions, value_conditions)

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details


