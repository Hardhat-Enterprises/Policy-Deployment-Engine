package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.redirect_rules_secure

import data.terraform.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Redirects must use HTTPS",
      "remedies": [
        "Ensure redirect locations start with https://",
        "Avoid insecure http:// redirects"
      ]
    },
    {
      "condition": "Redirect location must start with https://",
      "attribute_path": ["config", 0, "redirects", 0, "location"],
      "values": ["*://", [["https"]]],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Redirects must use permanent status code",
      "remedies": [
        "Use status_code = 301 for permanent redirects",
        "Avoid temporary codes like 302"
      ]
    },
    {
      "condition": "Redirect status_code must be 301",
      "attribute_path": ["config", 0, "redirects", 0, "status_code"],
      "values": [301],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
