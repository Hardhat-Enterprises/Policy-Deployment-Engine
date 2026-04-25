package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam.vars

# Validate that the IAM role is not a primitive role.
# Primitive roles (owner, editor, viewer) are overly broad — they grant
# access across ALL stores in the dataset (FHIR, DICOM, HL7v2, Consent),
# violating the principle of least privilege for PHI data access.
conditions := [
    [
    {"situation_description" : "Dataset IAM role must not be a primitive role",
    "remedies": [
        "Replace primitive roles with a specific healthcare dataset role",
        "Approved roles: roles/healthcare.datasetViewer, roles/healthcare.datasetAdmin"
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
