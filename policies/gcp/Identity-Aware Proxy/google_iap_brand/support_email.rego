package terraform.gcp.security.identity_aware_proxy.google_iap_brand.support_email

import data.terraform.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_brand.vars

# SECURITY POLICY (exact-match; helper-friendly)
# c.tf has: support_email = "support@example.com"
# nc.tf has: "support@gmail.com", "help@vendor.io", "support@example.com "

conditions := [
  [
    {
      "situation_description": "Support email must use corporate domain",
      "remedies": [
        "Set support_email = \"support@example.com\""
      ]
    },
    {
      "condition": "support_email must be corporate",
      "attribute_path": ["support_email"],
      "values": ["*@*", [["support"], ["example.com"]]],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Public/external/malformed support emails are not allowed",
      "remedies": [
        "Use a corporate mailbox (example.com)"
      ]
    },
    {
      "condition": "support_email must not be public/external/malformed",
      "attribute_path": ["support_email"],
      # By domain, not by address: the trailing space is the "example.com "
      # entry, which is how the whitespace case is caught.
      "values": ["*@*", [[], ["gmail.com", "vendor.io", "example.com "]]],
      "policy_type": "pattern blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
