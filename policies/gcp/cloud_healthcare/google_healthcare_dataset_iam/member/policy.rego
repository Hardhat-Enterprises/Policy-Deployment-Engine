package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam.vars

# Validate that the IAM member is not a public or overly broad identity.
# allUsers / allAuthenticatedUsers expose the dataset to the internet.
# projectOwner/Editor/Viewer grant project-wide access — exposing all stores
# (FHIR, DICOM, HL7v2, Consent) and violating least privilege.
conditions := [
    [
    {"situation_description" : "Dataset IAM member must not be allUsers or allAuthenticatedUsers",
    "remedies": [
        "Replace 'allUsers' or 'allAuthenticatedUsers' with a specific service account, user, or group",
        "Example: serviceAccount:my-sa@my-project.iam.gserviceaccount.com"
    ]},
    {
        "condition": "Check if member is not a public identity",
        "attribute_path" : ["member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "Dataset IAM member must not be a project-level identity (projectOwner, projectEditor, projectViewer)",
    "remedies": [
        "Replace projectOwner/projectEditor/projectViewer with a specific service account scoped to this resource",
        "Example: serviceAccount:my-sa@my-project.iam.gserviceaccount.com"
    ]},
    {
        "condition": "Check if member is not a project-level broad identity",
        "attribute_path" : ["member"],
        "values" : ["projectOwner:*", "projectEditor:*", "projectViewer:*"],
        "policy_type" : "pattern blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
