package terraform.gcp.security.identity_platform.inbound_saml_config.idp_config_check
import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.inbound_saml_config.vars

conditions := [

  # Blacklist: idp_entity_id should not be empty or placeholder
  [
    {
      "situation_description": "idp_entity_id in idp_config is blank or a placeholder.",
      "remedies": [
        "Provide a valid IdP entity ID that uniquely identifies the SAML provider."
      ]
    },
    {
      "condition": "Ensure idp_config.idp_entity_id is not empty or placeholder",
      "attribute_path": ["idp_config", "idp_entity_id"],
      "values": ["", " ", "-", "n/a", "N/A", "none", "None"],
      "policy_type": "blacklist"
    }
  ],

  # Blacklist: sso_url should not be empty or placeholder
  [
    {
      "situation_description": "sso_url in idp_config is blank or a placeholder.",
      "remedies": [
        "Provide a valid SSO URL to allow SAML redirection for authentication."
      ]
    },
    {
      "condition": "Ensure idp_config.sso_url is not empty or placeholder",
      "attribute_path": ["idp_config", "sso_url"],
      "values": ["", " ", "-", "n/a", "N/A", "none", "None"],
      "policy_type": "blacklist"
    }
  ],

  # Blacklist: x509_certificate should not be empty or placeholder
  [
    {
      "situation_description": "x509_certificate in idp_certificates[0] is blank or missing.",
      "remedies": [
        "Provide a valid x509 certificate for the IdP to validate SAML assertions."
      ]
    },
    {
      "condition": "Ensure x509_certificate is not blank",
      "attribute_path": ["idp_config", "idp_certificates", 0, "x509_certificate"],
      "values": ["", " ", "-", "n/a", "N/A", "none", "None"],
      "policy_type": "blacklist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
