package terraform.gcp.security.cloud_healthcare.google_healthcare_workspace.labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_workspace.vars

# Validate that the workspace has required labels with approved values.
# The Healthcare Workspace holds all Data Mapper IDE mappings and controls
# access to PHI transformation logic — proper classification is essential.
conditions := [
    [
    {"situation_description" : "Healthcare Workspace 'environment' label is not set to an approved value",
    "remedies": ["Set the 'environment' label to one of: dev, test, staging, prod"]},
    {
        "condition": "Check if environment label is in the approved allowlist",
        "attribute_path" : ["labels", "environment"],
        "values" : ["dev", "test", "staging", "prod"],
        "policy_type" : "whitelist"
    }
    ],
    [
    {"situation_description" : "Healthcare Workspace 'data-classification' label is not set to an approved value",
    "remedies": ["Set the 'data-classification' label to one of: phi, restricted"]},
    {
        "condition": "Check if data-classification label is in the approved allowlist",
        "attribute_path" : ["labels", "data-classification"],
        "values" : ["phi", "restricted"],
        "policy_type" : "whitelist"
    }
    ],
    [
    {"situation_description" : "Healthcare Workspace 'compliance' label is not set to an approved value",
    "remedies": ["Set the 'compliance' label to one of: hipaa, gdpr, both"]},
    {
        "condition": "Check if compliance label is in the approved allowlist",
        "attribute_path" : ["labels", "compliance"],
        "values" : ["hipaa", "gdpr", "both"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
