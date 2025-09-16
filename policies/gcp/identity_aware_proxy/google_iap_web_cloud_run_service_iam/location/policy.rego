package terraform.gcp.security.identity_aware_proxy.google_iap_web_cloud_run_service_iam.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_cloud_run_service_iam as vars

conditions := [
  [
    {"situation_description": "Cloud Run IAP must be restricted to approved regions",
     "remedies": ["Deploy only in approved regions or request an exception"]},
    {
      "condition": "location must be approved",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2", "us-central1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
