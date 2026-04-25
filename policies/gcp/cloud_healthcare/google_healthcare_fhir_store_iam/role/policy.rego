package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store_iam.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store_iam.vars

conditions := [
    [
    {"situation_description" : "FHIR Store IAM role must not be a primitive role",
    "remedies": [
        "Replace primitive roles with a specific FHIR store role",
        "Approved roles: roles/healthcare.fhirStoreViewer, roles/healthcare.fhirResourceReader, roles/healthcare.fhirStoreAdmin"
    ]},
    {
        "condition": "Check if role is not a primitive role",
        "attribute_path" : ["role"],
        "values" : ["roles/owner", "roles/editor", "roles/viewer"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
