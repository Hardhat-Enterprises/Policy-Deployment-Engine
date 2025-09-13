package terraform.gcp.security.analysis_note.expiration_time

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.expiration_time.vars

banned_values := vars.variables["banned_expiration_time_values"]
max_year      := vars.variables["max_expiration_year"]

conditions := [
  [
    {
      "situation_description": "The 'expiration_time' is empty or invalid (placeholder/epoch).",
      "remedies": [
        "Set a real ISO-8601 UTC timestamp (e.g., 2030-12-31T23:59:59Z).",
        "Use finite lifetimes to enforce periodic rotation."
      ],
    },
    {
      "condition": "expiration_time is NOT empty/placeholder",
      "attribute_path": ["expiration_time"],
      "values": banned_values,
      "policy_type": "blacklist"
    },
  ],
  [
    {
      "situation_description": "The 'expiration_time' is set unreasonably far in the future.",
      "remedies": [
        "Choose a nearer expiry within the org’s maximum window."
      ],
    },
    {
      # Helpers expect range: [min, max]
      # min = null (no lower bound), max = max_year
      "condition": "expiration_time is NOT set beyond the allowed maximum year",
      "attribute_path": ["expiration_time"],
      "values": [null, max_year],
      "policy_type": "range"
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
