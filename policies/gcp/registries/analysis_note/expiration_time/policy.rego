package terraform.gcp.security.analysis_note.expiration_time

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.expiration_time.vars

<<<<<<< HEAD
# Directly embed the banned values array here
banned_expiration_time_values := [
  null,                  # real null, not string "null"
=======
# banned values are declared directly here (per tutor feedback)
banned_expiration_time_values := [
  null,    # real null, not string "null"
>>>>>>> 30aa4c8e (Refactor expiration_time policie: moved banned arrays into policy files as per feedback)
  "",
  "0",
  "placeholder",
  "example",
  "1970-01-01T00:00:00Z"
]

conditions := [
  [
    {
      "situation_description": "The 'expiration_time' is empty, null, or a placeholder value.",
      "remedies": [
        "Set a real ISO-8601 UTC timestamp (e.g., 2030-12-31T23:59:59Z).",
        "Use finite lifetimes to enforce periodic rotation."
      ],
    },
    {
<<<<<<< HEAD
      "condition": "expiration_time must not be a banned placeholder",
      "attribute_path": ["expiration_time"],
      "values": banned_expiration_time_values,
      "policy_type": "blacklist"
    },
  ],
=======
      "condition": "expiration_time must not be null or placeholder",
      "attribute_path": ["expiration_time"],
      "values": banned_expiration_time_values,
      "policy_type": "blacklist"
    }
  ]
>>>>>>> 30aa4c8e (Refactor expiration_time policie: moved banned arrays into policy files as per feedback)
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
