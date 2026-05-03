package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.self_managed_private_key

import data.terraform.helpers as helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.vars as vars

conditions := [
  [
    {
      "situation_description": "When the PEM private key is directly defined in Terraform, self-managed certificates may reveal critical key information.",
      "remedies": [
        "Remove the private key from the Terraform configuration and store/manage it using a secure secret management process."
      ]
    },
    {
      "condition": "PEM private key material should not be defined directly in the self-managed certificate block.",
      "attribute_path": ["self_managed", 0, "pem_private_key"],
      "values": ["-----BEGIN (PRIVATE KEY|RSA PRIVATE KEY|EC PRIVATE KEY|ENCRYPTED PRIVATE KEY)-----", [["PRIVATE KEY", "RSA PRIVATE KEY", "EC PRIVATE KEY", "ENCRYPTED PRIVATE KEY"]]],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details