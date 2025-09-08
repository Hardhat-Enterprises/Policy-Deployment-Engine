## 🛡️ Policy Deployment Engine: `kms_ekm_connection`

This section provides a concise policy evaluation for the `kms_ekm_connection` resource in GCP.

Reference: [Terraform Registry – kms_ekm_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_ekm_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for the EkmConnection. | true | None | None |
| `location` | The location for the EkmConnection. A full list of valid locations can be found by running `gcloud kms locations list`. | true | None | None |
| `key_management_mode` | Optional. Describes who can perform control plane operations on the EKM. If unset, this defaults to MANUAL Default value is `MANUAL`. Possible values are: `MANUAL`, `CLOUD_KMS`. | false | None | None |
| `etag` | Optional. Etag of the currently stored EkmConnection. | false | None | None |
| `crypto_space_path` | Optional. Identifies the EKM Crypto Space that this EkmConnection maps to. Note: This field is required if KeyManagementMode is CLOUD_KMS. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### service_resolvers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_directory_service` | Required. The resource name of the Service Directory service pointing to an EKM replica, in the format projects/*/locations/*/namespaces/*/services/* | true | None | None |
| `hostname` | Required. The hostname of the EKM replica used at TLS and HTTP layers. | true | None | None |
| `server_certificates` | Required. A list of leaf server certificates used to authenticate HTTPS connections to the EKM replica. Currently, a maximum of 10 Certificate is supported. Structure is [documented below](#nested_service_resolvers_service_resolvers_server_certificates). | true | None | None |
| `endpoint_filter` | Optional. The filter applied to the endpoints of the resolved service. If no filter is specified, all endpoints will be considered. An endpoint will be chosen arbitrarily from the filtered list for each request. For endpoint filter syntax and examples, see https://cloud.google.com/service-directory/docs/reference/rpc/google.cloud.servicedirectory.v1#resolveservicerequest. | false | None | None |

### server_certificates Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_der` | Required. The raw certificate bytes in DER format. A base64-encoded string. | true | None | None |
| `parsed` | (Output) Output only. True if the certificate was parsed successfully. | none | None | None |
| `issuer` | (Output) Output only. The issuer distinguished name in RFC 2253 format. Only present if parsed is true. | none | None | None |
| `subject` | (Output) Output only. The subject distinguished name in RFC 2253 format. Only present if parsed is true. | none | None | None |
| `not_before_time` | (Output) Output only. The certificate is not valid before this time. Only present if parsed is true. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | none | None | None |
| `not_after_time` | (Output) Output only. The certificate is not valid after this time. Only present if parsed is true. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | none | None | None |
| `sha256_fingerprint` | (Output) Output only. The SHA-256 certificate fingerprint as a hex string. Only present if parsed is true. | none | None | None |
| `serial_number` | (Output) Output only. The certificate serial number as a hex string. Only present if parsed is true. | none | None | None |
| `subject_alternative_dns_names` | (Output) Output only. The subject Alternative DNS names. Only present if parsed is true. | none | None | None |
