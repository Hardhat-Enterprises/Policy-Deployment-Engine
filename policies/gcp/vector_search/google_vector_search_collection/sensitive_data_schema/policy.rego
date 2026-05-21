package terraform.gcp.security.vector_search.google_vector_search_collection.sensitive_data_schema

import data.terraform.helpers
import data.terraform.gcp.security.vector_search.google_vector_search_collection.vars

conditions := [
  [
    {
      "situation_description": "Vector Search Collection data_schema contains sensitive field names.",
      "remedies": ["Remove sensitive fields such as password, token, secret, ssn, credit_card, pii, api_key, or private_key from data_schema."]
    },
    {
      "condition": "data_schema contains sensitive field names",
      "attribute_path": ["data_schema"],
      "values": [
        "{\"properties\":{\"password\":{\"type\":\"string\"},\"token\":{\"type\":\"string\"}},\"type\":\"object\"}",
        "{\"properties\":{\"secret\":{\"type\":\"string\"},\"api_key\":{\"type\":\"string\"}},\"type\":\"object\"}",
        "{\"properties\":{\"ssn\":{\"type\":\"string\"},\"credit_card\":{\"type\":\"string\"}},\"type\":\"object\"}"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details