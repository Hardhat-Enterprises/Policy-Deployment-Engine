package terraform.gcp.security.identity_aware_proxy.google_iap_settings.allowed_domain

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_settings.vars

# Enforce Allowed Domains: feature enabled + corporate domain only
conditions := [
  [
    {"situation_description": "Allowed Domains must be enabled",
     "remedies": ["Set access_settings.allowed_domains_settings.enable = true"]},
    {
  "condition": "allowed domains feature enabled",
  "attribute_path": ["access_settings", 0, "allowed_domains_settings", 0, "enable"],
  "values": [true],
  "policy_type": "whitelist"
}
  ],
  [
    {"situation_description": "Only corporate domains are permitted",
     "remedies": ["Keep domains limited to example.com; remove public or wildcard domains"]},
    {
      "condition": "first allowed domain must be example.com",
      "attribute_path": ["access_settings", 0, "allowed_domains_settings", 0, "domains", 0],
      "values": ["example.com"],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "Block unsafe domains in allowlist",
     "remedies": ["Remove wildcard/public domains from allowed list"]},
    {
      "condition": "disallow wildcard/public domains",
      "attribute_path": ["access_settings", 0, "allowed_domains_settings", 0, "domains", 0],
      "values": ["*", "gmail.com", "yahoo.com"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details