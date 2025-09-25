package terraform.gcp.security.identity_aware_proxy.google_iap_brand.application_title

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_brand.vars

# c.tf title (allowed): "Cloud IAP – Customer Portal"
# nc.tf titles (blocked): "Test", "Demo", "My Application", "Cloud IAP – Customer Portal "

conditions := [
  [
    {
      "situation_description": "Application title must be a clear, production-ready name",
      "remedies": ["Set application_title = \"Cloud IAP – Customer Portal\""]
    },
    {
      "condition": "application_title must be the approved title",
      "attribute_path": ["application_title"],
      "values": ["Cloud IAP – Customer Portal"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Generic/test or malformed titles are not allowed",
      "remedies": ["Use the approved production title"]
    },
    {
      "condition": "application_title must not be generic/test/malformed",
      "attribute_path": ["application_title"],
      "values": ["Test", "Demo", "My Application", "Cloud IAP – Customer Portal "],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
