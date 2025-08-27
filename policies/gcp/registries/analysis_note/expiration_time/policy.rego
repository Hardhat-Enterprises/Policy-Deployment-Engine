inherited/gcp/service/container_registeries
package terraform.gcp.security.analysis_note.expiration_time

package terraform.gcp.security.registries.google_container_analysis_note.expiration_time
gcp/service/container_registries

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.expiration_time.vars

inherited/gcp/service/container_registeries
banned_exact := vars.variables["banned_expiration_exact"]
banned_regex := vars.variables["banned_expiration_far_future_regex"]

# SECURITY blacklist: disallow empty/placeholder/epoch and "far future" expiries
conditions := [
  # A) Empty/placeholder/epoch timestamps are banned
  [
    {
      "situation_description": "The 'expiration_time' is empty or invalid (placeholder/epoch).",
      "remedies": [
        "Set a real ISO-8601 UTC timestamp (e.g., 2030-12-31T23:59:59Z).",
        "Use finite lifetimes to force periodic rotation."
      ],
    },
    {
      "condition": "expiration_time is NOT a banned exact value",
      "attribute_path": ["expiration_time"],
      "values": banned_exact,
      "policy_type": "blacklist",
      "case_insensitive": true
    },
  ],

  # B) Unbounded or excessively long lifetimes are banned (far-future years)
  [
    {
      "situation_description": "The 'expiration_time' is set too far in the future.",
      "remedies": [
        "Choose a nearer expiry that complies with the org's maximum lifetime.",
        "Adopt regular key/note rotation."
      ],
    },
    {
      "condition": "expiration_time does NOT match far-future patterns",
      "attribute_path": ["expiration_time"],
      "regex": banned_regex,
      "policy_type": "blacklist"
    },
  ],

expiration_time_range := {"lower_bound": 1, "upper_bound": 365}

conditions := [
    [
        {"situation_description": "Expiration time is not within the valid range of 1 to 365 days.",
        "remedies": ["Ensure expiration time is between 1 and 365 days."]},
        {
            "condition": "Check if expiration time is within the valid range",
            "attribute_path": ["expiration_time"],
            "values": [expiration_time_range["lower_bound"], expiration_time_range["upper_bound"]],
            "policy_type": "range"
        }
    ]
gcp/service/container_registries
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
