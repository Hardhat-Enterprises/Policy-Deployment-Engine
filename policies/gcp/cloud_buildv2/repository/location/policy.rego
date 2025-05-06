package terraform.gcp.security.cloud_buildv2.repository.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

# This policy checks the location of a Google Cloud Build v2 repository.
# It ensures that the location is either one of the approved GCP regions or not in a blocked region list.
approved_locations := [
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
]

# Explicitly disallowed regions (add more if needed)
blocked_locations := [
  "europe-west9",
  "europe-south19",
  "custom-test-region"
]

scenarios_list := [
  # Scenario 1: Repository location must be one of the approved GCP regions
  [
    {
      "situation_description": "Repository location must be one of the approved GCP regions",
      "remedies": ["Set 'location' to one of the approved regions: global, us-central1, etc."]
    },
    {
      "condition": "Location value is not in the list of approved GCP regions",
      "attribute_path": ["location"],
      "values": approved_locations,
      "policy_type": "whitelist"
    }
  ],
  # Scenario 2: Repository location must not use blocked regions
  [
    {
      "situation_description": "Repository location must not use blocked regions (e.g., deprecated or internal)",
      "remedies": ["Avoid using deprecated or blocked locations like europe-west9 or test regions"]
    },
    {
      "condition": "Location is in a known blocked region list",
      "attribute_path": ["location"],
      "values": blocked_locations,
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
