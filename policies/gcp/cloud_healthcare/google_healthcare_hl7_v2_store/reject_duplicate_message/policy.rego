package terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store.reject_duplicate_message

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store.vars

# Validate that reject_duplicate_message is true.
# Allowing duplicate HL7v2 messages risks double-processing of clinical events
# such as duplicate ADT admissions, duplicate orders, or duplicate lab results,
# corrupting the integrity of the patient record and audit trail.
conditions := [
    [
    {"situation_description" : "HL7v2 Store allows duplicate messages — reject_duplicate_message is not true",
    "remedies": [
        "Set reject_duplicate_message to true to prevent duplicate clinical messages from being ingested",
        "Duplicate HL7v2 messages can cause double-processing of clinical events and corrupt patient records"
    ]},
    {
        "condition": "Check if reject_duplicate_message is true",
        "attribute_path" : ["reject_duplicate_message"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
