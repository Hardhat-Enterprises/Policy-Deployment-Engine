package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.disable_resource_versioning

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

# Validate that resource versioning is NOT disabled.
# Versioning maintains a full history of every FHIR resource change,
# which is required for HIPAA audit controls (§164.312(b)) and for
# tracking PHI access and modifications over time.
conditions := [
    [
    {"situation_description" : "FHIR Store has disable_resource_versioning set to true — audit trail is lost",
    "remedies": [
        "Set disable_resource_versioning to false to retain full FHIR resource history",
        "Versioning is required for HIPAA audit controls and PHI change tracking"
    ]},
    {
        "condition": "Check if disable_resource_versioning is not true",
        "attribute_path" : ["disable_resource_versioning"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
