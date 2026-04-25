package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.enable_consent_create_on_update

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.vars

# Validate that enable_consent_create_on_update is false.
# When true, PATCH operations become upserts (create-or-update), which breaks the
# distinct audit trail between consent creation and consent updates — a requirement
# for HIPAA §164.312(b) audit controls.
conditions := [
    [
    {"situation_description" : "Consent store has enable_consent_create_on_update set to true",
    "remedies":[ "Set enable_consent_create_on_update to false to preserve the create/update audit trail"]},
    {
        "condition": "Check if enable_consent_create_on_update is false",
        "attribute_path" : ["enable_consent_create_on_update"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
