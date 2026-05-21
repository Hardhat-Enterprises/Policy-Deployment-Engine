package terraform.gcp.security.vector_search.google_vector_search_collection.encryption_spec

import data.terraform.helpers
import data.terraform.gcp.security.vector_search.google_vector_search_collection.vars

conditions := [
  [
    {
      "situation_description": "Vector Search Collection is not encrypted with a customer-managed encryption key.",
      "remedies": ["Add encryption_spec with crypto_key_name using a Cloud KMS key."]
    },
    {
      "condition": "crypto_key_name is missing",
      "attribute_path": ["encryption_spec", 0, "crypto_key_name"],
      "values": null,
      "policy_type": "blacklist"
    },
    {
      "condition": "crypto_key_name is empty",
      "attribute_path": ["encryption_spec", 0, "crypto_key_name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details