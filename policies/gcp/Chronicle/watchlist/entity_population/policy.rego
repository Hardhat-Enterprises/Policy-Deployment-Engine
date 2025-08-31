package terraform.gcp.security.Chronicle.watchlist.entity_population

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.watchlist.vars

conditions := [
    [
    {
      "situation_description": "Watchlist relies solely on manual population of entities.",
      "remedies": [
        "Use automated mechanisms (e.g., API, integrations) to populate entities dynamically.",
        "Avoid using only manual population to reduce human error and ensure comprehensive coverage."
      ]
    },
    {
  "condition": "Block known-bad label IDs",
  "attribute_path": ["data_access_label_id"],
  "values": [{}],
  "policy_type": "blacklist"
}

  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
