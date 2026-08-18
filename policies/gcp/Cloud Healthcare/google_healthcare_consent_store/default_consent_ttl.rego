package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.default_consent_ttl

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.vars

conditions := [
  [
    {
      "situation_description": "Consent store does not have a default_consent_ttl configured — consents will never expire",
      "remedies": [
        "Set default_consent_ttl to a duration string of at least 86400s (24 hours)",
        "Example: default_consent_ttl = \"31536000s\" (1 year)"
      ]
    },
    {
      "condition": "Check if default_consent_ttl is not null",
      "attribute_path": ["default_consent_ttl"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details