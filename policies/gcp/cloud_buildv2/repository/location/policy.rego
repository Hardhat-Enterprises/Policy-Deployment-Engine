package terraform.gcp.security.cloud_buildv2.repository.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

# STEP 1: DEFINE SCENARIOS
scenarios_list := [
  [
    {
      "situation_description": "Repository location must be set to an approved GCP region",
      "remedies": ["Set 'location' to one of the approved secure GCP regions like 'global', 'us-central1', or 'europe-west1'"]
    },
    {
      "condition": "The repository location is not in the list of approved GCP regions",
      "attribute_path": ["location"],
      "values": [
        "global",
        "us-central1",
        "europe-west1",
        "asia-east1",
        "southamerica-east1",
        "australia-southeast1",
        "asia-southeast1",
        "asia-northeast1",
        "asia-northeast2",
        "asia-northeast3",
        "asia-south1",
        "asia-south2",
        "northamerica-northeast1"
      ],
      "policy_type": "whitelist"
    }
  ]
]

# STEP 2: APPLY NEW STRUCTURE FOR SUMMARY AND DETAILS
summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
