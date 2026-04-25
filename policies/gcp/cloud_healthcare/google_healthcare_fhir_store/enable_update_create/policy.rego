package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.enable_update_create

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

# Validate that enable_update_create is false.
# When true, HTTP PUT requests can create new FHIR resources (not just update),
# breaking the distinct create/update audit trail required for HIPAA compliance.
conditions := [
    [
    {"situation_description" : "FHIR Store has enable_update_create set to true — audit trail integrity is broken",
    "remedies": [
        "Set enable_update_create to false so PUT requests cannot create new FHIR resources",
        "This preserves the distinct create/update audit trail for PHI changes"
    ]},
    {
        "condition": "Check if enable_update_create is not true",
        "attribute_path" : ["enable_update_create"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
