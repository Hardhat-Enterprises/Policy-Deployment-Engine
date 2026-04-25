package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset.vars

# Validate that the dataset is deployed in an approved region.
# Healthcare data residency requirements restrict PHI to specific
# geographic locations for compliance with Australian Privacy Act and HIPAA.
conditions := [
    [
    {"situation_description" : "Healthcare Dataset location is not in an approved region",
    "remedies": [
        "Set location to one of the approved regions: australia-southeast1, australia-southeast2, us-central1, us-east1, us-east4"
    ]},
    {
        "condition": "Check if location is in the approved list",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2", "us-central1", "us-east1", "us-east4"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
