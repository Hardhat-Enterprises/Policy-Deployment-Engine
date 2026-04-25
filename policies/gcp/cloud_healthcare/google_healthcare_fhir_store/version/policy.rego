package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.version

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

# Validate that the FHIR store uses R4 — the current stable FHIR standard.
# DSTU2 and STU3 are legacy versions with limited security features and
# reduced interoperability support. R4 is the minimum for new PHI workloads.
conditions := [
    [
    {"situation_description" : "FHIR Store version must be R4 or R5 (modern FHIR standard)",
    "remedies": [
        "Set version to R4 or R5",
        "DSTU2 and STU3 are legacy versions and must not be used for new PHI workloads"
    ]},
    {
        "condition": "Check if FHIR version is a modern supported standard",
        "attribute_path" : ["version"],
        "values" : ["R4", "R5"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
