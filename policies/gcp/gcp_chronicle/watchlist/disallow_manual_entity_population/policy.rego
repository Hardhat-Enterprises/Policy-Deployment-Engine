package terraform.gcp.security.chronicle.watchlist.disallow_manual_entity_population

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.watchlist.vars

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
  "attribute_path": ["entity_population_mechanism",0],
  "values": [{}],
  "policy_type": "whitelist"
}

  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
