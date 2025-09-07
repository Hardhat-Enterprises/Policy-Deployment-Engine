## 🛡️ Policy Deployment Engine: `network_security_client_tls_policy`

This section provides a concise policy evaluation for the `network_security_client_tls_policy` resource in GCP.

Reference: [Terraform Registry – network_security_client_tls_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_client_tls_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the ClientTlsPolicy resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the ClientTlsPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sni`
- Description: (Optional) Server Name Indication string to present to the server during TLS handshake. E.g: "secure.example.com".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) Defines a mechanism to provision client identity (public and private keys) for peer to peer authentication. The presence of this dictates mTLS. Structure is [documented below](#nested_client_certificate).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_validation_ca`
- Description: (Optional) Defines the mechanism to obtain the Certificate Authority certificate to validate the server certificate. If empty, client does not validate the server certificate. Structure is [documented below](#nested_server_validation_ca).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the client tls policy. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_client_certificate"></a>The `client_certificate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_endpoint`
- Description: (Optional) gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_client_certificate_grpc_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_provider_instance`
- Description: (Optional) The certificate provider instance specification that will be passed to the data plane, which will be used to load necessary credential information. Structure is [documented below](#nested_client_certificate_certificate_provider_instance). <a name="nested_client_certificate_grpc_endpoint"></a>The `grpc_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_uri`
- Description: (Required) The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". <a name="nested_client_certificate_certificate_provider_instance"></a>The `certificate_provider_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_instance`
- Description: (Required) Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance. <a name="nested_server_validation_ca"></a>The `server_validation_ca` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_endpoint`
- Description: (Optional) gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_server_validation_ca_server_validation_ca_grpc_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_provider_instance`
- Description: (Optional) The certificate provider instance specification that will be passed to the data plane, which will be used to load necessary credential information. Structure is [documented below](#nested_server_validation_ca_server_validation_ca_certificate_provider_instance). <a name="nested_server_validation_ca_server_validation_ca_grpc_endpoint"></a>The `grpc_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_uri`
- Description: (Required) The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". <a name="nested_server_validation_ca_server_validation_ca_certificate_provider_instance"></a>The `certificate_provider_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_instance`
- Description: (Required) Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
