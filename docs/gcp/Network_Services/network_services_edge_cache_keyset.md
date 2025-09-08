## 🛡️ Policy Deployment Engine: `network_services_edge_cache_keyset`

This section provides a concise policy evaluation for the `network_services_edge_cache_keyset` resource in GCP.

Reference: [Terraform Registry – network_services_edge_cache_keyset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_edge_cache_keyset)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit. | true | None | None |
| `description` | A human-readable description of the resource. | false | None | None |
| `labels` | Set of label tags associated with the EdgeCache resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### public_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The ID of the public key. The ID must be 1-63 characters long, and comply with RFC1035. The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit. | true | None | None |
| `value` | The base64-encoded value of the Ed25519 public key. The base64 encoding can be padded (44 bytes) or unpadded (43 bytes). Representations or encodings of the public key other than this will be rejected with an error. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `managed` | Set to true to have the CDN automatically manage this public key value. | false | None | None |

### validation_shared_keys Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The name of the secret version in Secret Manager. The resource name of the secret version must be in the format `projects/*/secrets/*/versions/*` where the `*` values are replaced by the secrets themselves. The secrets must be at least 16 bytes large.  The recommended secret size depends on the signature algorithm you are using. * If you are using HMAC-SHA1, we suggest 20-byte secrets. * If you are using HMAC-SHA256, we suggest 32-byte secrets. See RFC 2104, Section 3 for more details on these recommendations. | true | None | None |
