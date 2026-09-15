package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.eventing_config_additional_variable_encryption_key_value_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "No customer-managed KMS key is set on the eventing variable, so the value is encrypted under a Google-managed key and the organisation controls neither its rotation nor its revocation.",
      "remedies": [
        "Set kms_key_name to a customer-managed KMS key and set the encryption type to CUSTOMER_MANAGED."
      ]
    },
    {
      "condition": "eventing_config.additional_variable.encryption_key_value.kms_key_name must not be left empty.",
      "attribute_path": ["eventing_config", 0, "additional_variable", 0, "encryption_key_value", 0, "kms_key_name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
