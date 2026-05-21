package terraform.gcp.security.vector_search.google_vector_search_collection.sensitive_collection_id

import data.terraform.helpers
import data.terraform.gcp.security.vector_search.google_vector_search_collection.vars

conditions := [
  [
    {
      "situation_description": "Vector Search Collection ID contains sensitive or risky words.",
      "remedies": ["Remove sensitive words such as password, secret, token, credential, private, pii, or customer-data from collection_id."]
    },
    {
      "condition": "collection_id contains a sensitive or risky value",
      "attribute_path": ["collection_id"],
      "values": [
        "password",
        "secret",
        "token",
        "credential",
        "credentials",
        "private",
        "pii",
        "customer-data",
        "customer_data",
        "nc-password-token-collection"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details