package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.effective_labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.vars

# Validate that effective_labels (computed: user labels + provider default_labels) are not null.
# effective_labels is computed at apply time and may appear in after_unknown during plan.
# This rule ensures the labels block is set so effective_labels will be populated.
conditions := [
    [
    {"situation_description" : "Consent store effective_labels are not configured",
    "remedies":[ "Ensure the labels block is defined with required labels so effective_labels are populated"]},
    {
        "condition": "Check if effective_labels is not null",
        "attribute_path" : ["effective_labels"],
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
