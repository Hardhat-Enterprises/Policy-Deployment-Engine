## 🛡️ Policy Deployment Engine: `network_security_client_tls_policy`

This section provides a concise policy evaluation for the `network_security_client_tls_policy` resource in GCP.

Reference: [Terraform Registry – network_security_client_tls_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_client_tls_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the ClientTlsPolicy resource. | true | None | None |
| `labels` | Set of label tags associated with the ClientTlsPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `sni` | Server Name Indication string to present to the server during TLS handshake. E.g: "secure.example.com". | false | None | None |
| `location` | The location of the client tls policy. The default value is `global`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### client_certificate Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `grpc_endpoint` | gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_client_certificate_grpc_endpoint). | false | None | None |
| `certificate_provider_instance` | The certificate provider instance specification that will be passed to the data plane, which will be used to load necessary credential information. Structure is [documented below](#nested_client_certificate_certificate_provider_instance). | false | None | None |

### server_validation_ca Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `grpc_endpoint` | gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_server_validation_ca_server_validation_ca_grpc_endpoint). | false | None | None |
| `certificate_provider_instance` | The certificate provider instance specification that will be passed to the data plane, which will be used to load necessary credential information. Structure is [documented below](#nested_server_validation_ca_server_validation_ca_certificate_provider_instance). | false | None | None |

### grpc_endpoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_uri` | The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". | true | None | None |

### certificate_provider_instance Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `plugin_instance` | Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance. | true | None | None |
