package terraform.gcp.security.datastream.stream.location_compliance
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.stream.vars

conditions := [
    [
    {"situation_description": "Datastream Stream is deployed in a non-approved GCP location.",
    "remedies": ["Set the 'location' field to one of the approved values: australia-southeast1, us-central1, us-east1, us-west1, europe-west1, europe-west2, asia-east1, asia-southeast1, asia-south1, northamerica-northeast1."]},
    {
    "condition": "Checks if the location is one of the approved regions.",
    "attribute_path": ["location"],
    "values": ["australia-southeast1", "us-central1", "us-east1", "us-west1", "europe-west1","europe-west2","asia-east1", "asia-southeast1","asia-south1", "northamerica-northeast1"],
    "policy_type": "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
