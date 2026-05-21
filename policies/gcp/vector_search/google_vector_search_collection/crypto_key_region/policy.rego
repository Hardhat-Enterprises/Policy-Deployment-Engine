package terraform.gcp.security.vector_search.google_vector_search_collection.crypto_key_region

import data.terraform.helpers
import data.terraform.gcp.security.vector_search.google_vector_search_collection.vars

conditions := [
  [
    {
      "situation_description": "Vector Search Collection uses a Cloud KMS key from an unapproved region.",
      "remedies": ["Use a Cloud KMS key in an approved region such as australia-southeast1 or australia-southeast2."]
    },
    {
      "condition": "crypto_key_name must use an approved KMS location",
      "attribute_path": ["encryption_spec", 0, "crypto_key_name"],
      "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*", [["dummy-project"], ["australia-southeast1", "australia-southeast2"], ["vector-search-key-ring"], ["vector-search-key"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details