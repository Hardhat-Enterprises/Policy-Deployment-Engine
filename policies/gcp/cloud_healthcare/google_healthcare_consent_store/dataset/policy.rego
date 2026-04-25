package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.dataset

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.vars

# Validate that the parent dataset location (embedded in the dataset path) is in an approved region.
# The dataset field is a fully-qualified path: projects/{project}/locations/{location}/datasets/{name}
conditions := [
    [
    {"situation_description" : "Consent store parent dataset is not in an approved location",
    "remedies":[ "Deploy the parent healthcare dataset in an approved region (e.g. australia-southeast1, australia-southeast2, us-central1, us-east1, us-east4)"]},
    {
        "condition": "Check if the dataset path contains an approved location",
        "attribute_path" : ["dataset"],
        "values" : ["projects/*/locations/*/datasets/*", [null, ["australia-southeast1", "australia-southeast2", "us-central1", "us-east1", "us-east4"], null]],
        "policy_type" : "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
