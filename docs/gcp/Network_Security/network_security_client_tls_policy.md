## 🛡️ Policy Deployment Engine: `network_security_client_tls_policy`

This section provides a concise policy evaluation for the `network_security_client_tls_policy` resource in GCP.

Reference: [Terraform Registry – network_security_client_tls_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_client_tls_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the ClientTlsPolicy resource. | true | false | None | None | None |
| `labels` | Set of label tags associated with the ClientTlsPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | false | None | None | None |
| `sni` | Server Name Indication string to present to the server during TLS handshake. E.g: "secure.example.com". | false | true | Must be secure.com. | ['"secure.com"'] | ['"insecure.com"'] |
| `client_certificate` | Defines a mechanism to provision client identity (public and private keys) for peer to peer authentication. The presence of this dictates mTLS. Structure is [documented below](#nested_client_certificate). | false | false | None | None | None |
| `server_validation_ca` | Defines the mechanism to obtain the Certificate Authority certificate to validate the server certificate. If empty, client does not validate the server certificate. | false | true | Ensures the client validates the server certificate by configuring server_validation_ca. | ['unix:mypath'] | ['mypath'] |
| `location` | The location of the client tls policy. The default value is `global`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `grpc_endpoint` |  | false | false | None | None | None |
| `certificate_provider_instance` |  | false | false | None | None | None |

### client_certificate Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `grpc_endpoint` | gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_client_certificate_grpc_endpoint). | false | false | None | None | None |
| `certificate_provider_instance` | Certificate provider instance used in the client_certificate block. | false | true | Restricting plugin_instance to an approved value helps enforce trusted client certificate configuration. | ['"google_cloud_private_spiffe"'] | ['"google_cloud_private"'] |

### server_validation_ca Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `grpc_endpoint` | gRPC specific configuration to access the gRPC server to obtain the cert and private key. Structure is [documented below](#nested_server_validation_ca_server_validation_ca_grpc_endpoint). | false | false | None | None | None |
| `certificate_provider_instance` | The certificate provider instance specification that will be passed to the data plane, which will be used to load necessary credential information. Structure is [documented below](#nested_server_validation_ca_server_validation_ca_certificate_provider_instance). | false | false | None | None | None |

### grpc_endpoint Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_uri` | The target URI of the gRPC endpoint. Only UDS path is supported, and should start with "unix:". | true | false | None | None | None |

### certificate_provider_instance Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `plugin_instance` | Plugin instance name, used to locate and load CertificateProvider instance configuration. Set to "google_cloud_private_spiffe" to use Certificate Authority Service certificate provider instance. | true | false | None | None | None |
