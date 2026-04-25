package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.default_consent_ttl

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.vars

# Validate that default_consent_ttl is explicitly set.
# When null, consents never expire — violating data retention/storage limitation requirements.
# Note: The TTL is a protobuf duration string (e.g. "31536000s"). Minimum allowed is 86400s (1 day)
# by the API, but policy enforces a minimum of 31536000s (1 year) for compliance.
conditions := [
    [
    {"situation_description" : "Consent store does not have a default consent TTL configured",
    "remedies":[ "Set default_consent_ttl to a duration of at least 31536000s (1 year)", "Example: default_consent_ttl = \"31536000s\""]},
    {
        "condition": "Check if default_consent_ttl is not null",
        "attribute_path" : ["default_consent_ttl"],
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
