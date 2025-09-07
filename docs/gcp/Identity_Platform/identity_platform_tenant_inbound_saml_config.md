## 🛡️ Policy Deployment Engine: `identity_platform_tenant_inbound_saml_config`

This section provides a concise policy evaluation for the `identity_platform_tenant_inbound_saml_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_tenant_inbound_saml_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_tenant_inbound_saml_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the InboundSamlConfig resource. Must start with 'saml.' and can only have alphanumeric characters, hyphens, underscores or periods. The part after 'saml.' must also start with a lowercase letter, end with an alphanumeric character, and have at least 2 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tenant`
- Description: (Required) The name of the tenant where this inbound SAML config resource exists
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Human friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idp_config`
- Description: (Required) SAML IdP configuration when the project acts as the relying party Structure is [documented below](#nested_idp_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sp_config`
- Description: (Required) SAML SP (Service Provider) configuration when the project acts as the relying party to receive and accept an authentication assertion issued by a SAML identity provider. Structure is [documented below](#nested_sp_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If this config allows users to sign in with the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_idp_config"></a>The `idp_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idp_entity_id`
- Description: (Required) Unique identifier for all SAML entities
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sso_url`
- Description: (Required) URL to send Authentication request to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sign_request`
- Description: (Optional) Indicates if outbounding SAMLRequest should be signed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idp_certificates`
- Description: (Required) The IDP's certificate data to verify the signature in the SAMLResponse issued by the IDP. Structure is [documented below](#nested_idp_config_idp_certificates). <a name="nested_idp_config_idp_certificates"></a>The `idp_certificates` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `x509_certificate`
- Description: (Optional) The x509 certificate <a name="nested_sp_config"></a>The `sp_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sp_entity_id`
- Description: (Required) Unique identifier for all SAML entities.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `callback_uri`
- Description: (Required) Callback URI where responses from IDP are handled. Must start with `https://`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sp_certificates`
- Description: (Output) The IDP's certificate data to verify the signature in the SAMLResponse issued by the IDP. Structure is [documented below](#nested_sp_config_sp_certificates). <a name="nested_sp_config_sp_certificates"></a>The `sp_certificates` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `x509_certificate`
- Description: (Output) The x509 certificate
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
