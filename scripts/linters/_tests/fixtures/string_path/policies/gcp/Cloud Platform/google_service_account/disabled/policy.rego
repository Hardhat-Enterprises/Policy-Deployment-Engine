package terraform.gcp.security.cloud_platform_service.google_service_account.disabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account.vars

# attribute_path given as a bare string — a form shared.rego supports.
conditions := [
  [
    {"situation_description": "Service account is created in a disabled state.",
     "remedies": ["Create active identities; disable later with justification."]},
    {"condition": "Disabled on creation",
     "attribute_path": "disabled",
     "values": [true],
     "policy_type": "blacklist"}
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
