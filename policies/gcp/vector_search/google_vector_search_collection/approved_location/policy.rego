package terraform.gcp.security.vector_search.google_vector_search_collection.approved_location

import data.terraform.helpers
import data.terraform.gcp.security.vector_search.google_vector_search_collection.vars

conditions := [
  [
    {
      "situation_description": "Vector Search Collection is deployed in an unapproved location.",
      "remedies": ["Set location to an approved region such as australia-southeast1 or australia-southeast2."]
    },
    {
      "condition": "location must be an approved region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details