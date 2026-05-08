package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations.run.googleapis.com.encryption_key

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses an unapproved encryption key",
      "remedies": [
        "Use an approved Cloud KMS encryption key",
        "Use a key from the approved project, region, key ring, and crypto key"
      ]
    },
    {
     "condition": "Encryption key annotation must match the approved KMS key path",
     "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/encryption-key"],
     "values": [
     "projects/my-gcp-project/locations/australia-southeast1/keyRings/prod-keyring/cryptoKeys/cloudrun-key"
      ],
     "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details