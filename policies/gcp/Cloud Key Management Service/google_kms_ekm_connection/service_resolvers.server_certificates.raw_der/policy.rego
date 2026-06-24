package terraform.gcp.security.google_kms.google_kms_ekm_connection.service_resolvers_server_certificates_raw_der
import data.terraform.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_ekm_connection.vars as vars

conditions := [
    [
    {
      "situation_description": "Server certificate must match one of the allowed values",
      "remedies": [
        "Ensure the raw_der certificate is approved for use",
        "Use an approved certificate value for the associated hostname"
      ]
    },
    {
      "condition": "Approved raw_der certs",
      "attribute_path": ["service_resolvers", 0, "server_certificates", 0, "raw_der"],
      "values": ["AU_CERT_ABC","EU_CERT_DEF"],
      "policy_type": "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
