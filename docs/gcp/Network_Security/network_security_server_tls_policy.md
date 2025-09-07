## 🛡️ Policy Deployment Engine: `network_security_server_tls_policy`

This section provides a concise policy evaluation for the `network_security_server_tls_policy` resource in GCP.

Reference: [Terraform Registry – network_security_server_tls_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_server_tls_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the ServerTlsPolicy resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the ServerTlsPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_open`
- Description: (Optional) This field applies only for Traffic Director policies. It is must be set to false for external HTTPS load balancer policies. Determines if server allows plaintext connections. If set to true, server allows plain text connections. By default, it is set to false. This setting is not exclusive of other encryption modes. For example, if allowOpen and mtlsPolicy are set, server allows both plain text and mTLS connections. See documentation of other encryption modes to confirm compatibility. Consider using it if you wish to upgrade in place your deployment to TLS while having mixed TLS and non-TLS traffic reaching port :80.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_certificate`
- Description: (Optional) Defines a mechanism to provision client identity (public and private keys) for peer to peer authentication. The presence of this dictates mTLS. Structure is [documented below](#nested_server_certificate).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mtls_policy`
- Description: (Optional) This field is required if the policy is used with external HTTPS load balancers. This field can be empty for Traffic Director. Defines a mechanism to provision peer validation certificates for peer to peer authentication (Mutual TLS - mTLS). If not specified, client certificate will not be requested. The connection is treated as TLS and not mTLS. If allowOpen and mtlsPolicy are set, server allows both plain text and mTLS connections. Structure is [documented below](#nested_mtls_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the server tls policy. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_server_certificate"></a>The `server_certificate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_endpoint`
- Description: (Optional) gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_server_certificate_grpc_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_provider_instance`
- Description: (Optional) Optional if policy is to be used with Traffic Director. For external HTTPS load balancer must be empty. Defines a mechanism to provision server identity (public and private keys). Cannot be combined with allowOpen as a permissive mode that allows both plain text and TLS is not supported. Structure is [documented below](#nested_server_certificate_certificate_provider_instance). <a name="nested_server_certificate_grpc_endpoint"></a>The `grpc_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_uri`
- Description: (Required) The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". <a name="nested_server_certificate_certificate_provider_instance"></a>The `certificate_provider_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_instance`
- Description: (Required) Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance. <a name="nested_mtls_policy"></a>The `mtls_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_validation_mode`
- Description: (Optional) When the client presents an invalid certificate or no certificate to the load balancer, the clientValidationMode specifies how the client connection is handled. Required if the policy is to be used with the external HTTPS load balancing. For Traffic Director it must be empty. Possible values are: `CLIENT_VALIDATION_MODE_UNSPECIFIED`, `ALLOW_INVALID_OR_MISSING_CLIENT_CERT`, `REJECT_INVALID`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_validation_trust_config`
- Description: (Optional) Reference to the TrustConfig from certificatemanager.googleapis.com namespace. If specified, the chain validation will be performed against certificates configured in the given TrustConfig. Allowed only if the policy is to be used with external HTTPS load balancers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_validation_ca`
- Description: (Optional) Required if the policy is to be used with Traffic Director. For external HTTPS load balancers it must be empty. Defines the mechanism to obtain the Certificate Authority certificate to validate the client certificate. Structure is [documented below](#nested_mtls_policy_client_validation_ca). <a name="nested_mtls_policy_client_validation_ca"></a>The `client_validation_ca` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_endpoint`
- Description: (Optional) gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_mtls_policy_client_validation_ca_client_validation_ca_grpc_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_provider_instance`
- Description: (Optional) Optional if policy is to be used with Traffic Director. For external HTTPS load balancer must be empty. Defines a mechanism to provision server identity (public and private keys). Cannot be combined with allowOpen as a permissive mode that allows both plain text and TLS is not supported. Structure is [documented below](#nested_mtls_policy_client_validation_ca_client_validation_ca_certificate_provider_instance). <a name="nested_mtls_policy_client_validation_ca_client_validation_ca_grpc_endpoint"></a>The `grpc_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_uri`
- Description: (Required) The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". <a name="nested_mtls_policy_client_validation_ca_client_validation_ca_certificate_provider_instance"></a>The `certificate_provider_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_instance`
- Description: (Required) Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
