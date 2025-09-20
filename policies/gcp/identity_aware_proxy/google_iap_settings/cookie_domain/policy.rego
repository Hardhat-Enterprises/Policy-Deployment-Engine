package terraform.gcp.security.identity_aware_proxy.google_iap_settings.cookie_domain

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_settings.vars

# SECURITY POLICY (exact-match; helper-friendly)
# Goal: cookie_domain must use your corporate domain. Block public/external/malformed examples
# that appear in fixtures (nc.tf).
#
# Compliant in c.tf:
# - cookie_domain = "example.com"
#
# Non-compliant in nc.tf:
# - "gmail.com"          (public email domain)
# - "vendor.io"          (external vendor)
# - "example.com "       (trailing space → sloppy/typo)

conditions := [
  # 1) Require corporate cookie domain
  [
    {
      "situation_description": "Cookie domain must use the corporate domain",
      "remedies": [
        "Set application_settings.cookie_domain = \"example.com\""
      ]
    },
    {
      "condition": "cookie_domain must be example.com",
      "attribute_path": ["application_settings", 0, "cookie_domain"],
      "values": ["example.com"],
      "policy_type": "whitelist"
    }
  ],

  # 2) Block known-bad examples from nc.tf
  [
    {
      "situation_description": "Public/external/malformed cookie domains are not allowed",
      "remedies": [
        "Use the corporate domain only (example.com)"
      ]
    },
    {
      "condition": "cookie_domain must not be external or malformed",
      "attribute_path": ["application_settings", 0, "cookie_domain"],
      "values": ["gmail.com", "vendor.io", "example.com "],
      "policy_type": "blacklist"
    }
  ]
]

# Summaries (same helper usage)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
