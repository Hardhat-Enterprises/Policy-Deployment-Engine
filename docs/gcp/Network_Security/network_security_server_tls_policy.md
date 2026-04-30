## 🛡️ Policy Deployment Engine: `network_security_server_tls_policy`

This section provides a concise policy evaluation for the `network_security_server_tls_policy` resource in GCP.

Reference: [Terraform Registry – network_security_server_tls_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_server_tls_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the ServerTlsPolicy resource. | true | false | None | None | None |
| `labels` | Set of label tags associated with the ServerTlsPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | false | None | None | None |
| `allow_open` | Determines if plaintext connections are allowed. | false | true | Setting allow_open to false ensures only secure TLS connections are allowed. | [False] | [True] |
| `server_certificate` | Defines a mechanism to provision client identity (public and private keys) for peer to peer authentication. The presence of this dictates mTLS. Structure is [documented below](#nested_server_certificate). | false | false | None | None | None |
| `mtls_policy` | Defines the mTLS policy for the server TLS policy. | false | true | Ensures mtls_policy is defined. | [{'client_validation_mode': 'REJECT_INVALID', 'client_validation_trust_config': 'projects/123/locations/global/trustConfigs/tc'}] | [None] |
| `location` | The location of the server tls policy. The default value is `global`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `grpc_endpoint` |  | false | false | None | None | None |
| `certificate_provider_instance` |  | false | false | None | None | None |
| `client_validation_ca` |  | false | false | None | None | None |

### server_certificate Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `grpc_endpoint` | gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_server_certificate_grpc_endpoint). | false | false | None | None | None |
| `certificate_provider_instance` | Optional if policy is to be used with Traffic Director. For external HTTPS load balancer must be empty. Defines a mechanism to provision server identity (public and private keys). Cannot be combined with allowOpen as a permissive mode that allows both plain text and TLS is not supported. Structure is [documented below](#nested_server_certificate_certificate_provider_instance). | false | false | None | None | None |

### mtls_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_validation_mode` | When the client presents an invalid certificate or no certificate to the load balancer, the clientValidationMode specifies how the client connection is handled. Required if the policy is to be used with the external HTTPS load balancing. For Traffic Director it must be empty. Possible values are: `CLIENT_VALIDATION_MODE_UNSPECIFIED`, `ALLOW_INVALID_OR_MISSING_CLIENT_CERT`, `REJECT_INVALID`. | false | false | None | None | None |
| `client_validation_trust_config` | Reference to the TrustConfig from certificatemanager.googleapis.com namespace. If specified, the chain validation will be performed against certificates configured in the given TrustConfig. Allowed only if the policy is to be used with external HTTPS load balancers. | false | false | None | None | None |
| `client_validation_ca` | Required if the policy is to be used with Traffic Director. For external HTTPS load balancers it must be empty. Defines the mechanism to obtain the Certificate Authority certificate to validate the client certificate. Structure is [documented below](#nested_mtls_policy_client_validation_ca). | false | false | None | None | None |

### grpc_endpoint Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_uri` | The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". | true | false | None | None | None |

### certificate_provider_instance Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `plugin_instance` | Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance. | true | false | None | None | None |

### client_validation_ca Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `grpc_endpoint` | gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_mtls_policy_client_validation_ca_client_validation_ca_grpc_endpoint). | false | false | None | None | None |
| `certificate_provider_instance` | Optional if policy is to be used with Traffic Director. For external HTTPS load balancer must be empty. Defines a mechanism to provision server identity (public and private keys). Cannot be combined with allowOpen as a permissive mode that allows both plain text and TLS is not supported. Structure is [documented below](#nested_mtls_policy_client_validation_ca_client_validation_ca_certificate_provider_instance). | false | false | None | None | None |
