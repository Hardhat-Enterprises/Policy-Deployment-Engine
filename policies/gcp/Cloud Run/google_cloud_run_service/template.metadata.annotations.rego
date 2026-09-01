package terraform.gcp.security.cloud_run.google_cloud_run_service.template_metadata_annotations

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

# Merged `template.metadata.annotations`-scoped policy. Each element of
# `conditions` is an independent scenario evaluated on its own by
# helpers.get_multi_summary:
#   1. ingress               - template ingress must not be public
#   2. maxScale              - max scale must be within the approved range
#   3. binary-authorization  - binary authorization must use an approved value
#   4. cloudsql-instances    - Cloud SQL instance connection must be approved
#   5. encryption-key        - encryption key must match the approved KMS key
#   6. vpc-access-connector  - VPC access connector must be approved
#   7. vpc-access-egress     - VPC egress routing must use an approved value
conditions := [
  [
    {
      "situation_description": "Cloud Run service template allows public ingress",
      "remedies": [
        "Restrict ingress to internal only",
        "Use run.googleapis.com/ingress = internal"
      ]
    },
    {
      "condition": "Template ingress must not be public",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/ingress"],
      "values": ["internal"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service max scale is outside the approved range",
      "remedies": [
        "Set maxScale within the approved range",
        "Avoid excessive scaling limits that can increase cost or abuse risk"
      ]
    },
    {
      "condition": "Max scale must be within the approved range",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "autoscaling.knative.dev/maxScale"],
      "values": [1, 50],
      "policy_type": "range"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service does not use approved binary authorization configuration",
      "remedies": [
        "Enable binary authorization for Cloud Run",
        "Set run.googleapis.com/binary-authorization to default"
      ]
    },
    {
      "condition": "Binary authorization annotation must use an approved value",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/binary-authorization"],
      "values": ["default"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service connects to an unapproved Cloud SQL instance",
      "remedies": [
        "Use only approved Cloud SQL instance connections",
        "Set run.googleapis.com/cloudsql-instances to my-gcp-project:australia-southeast1:prod-db"
      ]
    },
    {
      "condition": "Cloud SQL instance annotation must use an approved instance connection",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/cloudsql-instances"],
      "values": ["my-gcp-project:australia-southeast1:prod-db"],
      "policy_type": "whitelist"
    }
  ],
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
        "projects/*/locations/*/keyRings/*/cryptoKeys/*",
        [["my-gcp-project"], ["australia-southeast1"], ["prod-keyring"], ["cloudrun-key"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service uses an unapproved VPC access connector",
      "remedies": [
        "Use an approved VPC access connector",
        "Set run.googleapis.com/vpc-access-connector to the approved production connector"
      ]
    },
    {
      "condition": "VPC access connector annotation must use an approved connector",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/vpc-access-connector"],
      "values": [
        "projects/*/locations/*/connectors/*",
        [["my-gcp-project"], ["australia-southeast1"], ["prod-vpc-connector"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service uses unapproved VPC egress routing",
      "remedies": [
        "Use approved VPC egress routing",
        "Set run.googleapis.com/vpc-access-egress to private-ranges-only"
      ]
    },
    {
      "condition": "VPC access egress annotation must use an approved value",
      "attribute_path": ["template", 0, "metadata", 0, "annotations", "run.googleapis.com/vpc-access-egress"],
      "values": ["private-ranges-only"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
