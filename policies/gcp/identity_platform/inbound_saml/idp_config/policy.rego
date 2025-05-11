package terraform.gcp.security.identity_platform.inbound_saml_config.idp_config_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml_config.vars

conditions := [

  # idp_entity_id non-empty
  [
    {
      "situation_description": "idp_entity_id in idp_config is blank.",
      "remedies": [
        "Provide a valid IdP entity ID."
      ]
    },
    {
      "condition": "Check that idp_config.idp_entity_id is non-empty",
      "attribute_path": ["idp_config", "idp_entity_id"],
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ],

  #sso_url non-empty
  [
    {
      "situation_description": "sso_url in idp_config is blank.",
      "remedies": [
        "Provide a valid SSO URL for the SAML provider."
      ]
    },
    {
      "condition": "Check that idp_config.sso_url is non-empty",
      "attribute_path": ["idp_config", "sso_url"],
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ],

  # idp_certificates.x509_certificate non-empty
  [
    {
      "situation_description": "x509_certificate in idp_certificates is missing or blank.",
      "remedies": [
        "Provide a valid x509 certificate for the IdP."
      ]
    },
    {
      "condition": "Check that idp_certificates[0].x509_certificate is non-empty",
      "attribute_path": ["idp_config", "idp_certificates", 0, "x509_certificate"],
      "values": [".+"],
      "policy_type": "pattern whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details