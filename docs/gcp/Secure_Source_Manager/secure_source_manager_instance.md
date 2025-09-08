## 🛡️ Policy Deployment Engine: `secure_source_manager_instance`

This section provides a concise policy evaluation for the `secure_source_manager_instance` resource in GCP.

Reference: [Terraform Registry – secure_source_manager_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secure_source_manager_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the Instance. | true | None | None |
| `instance_id` | The name for the Instance. | true | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `kms_key` | Customer-managed encryption key name, in the format projects/*/locations/*/keyRings/*/cryptoKeys/*. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | to be abandoned, rather than deleted. Setting `DELETE` deletes the resource and all its contents. Setting `PREVENT` prevents the resource from accidental deletion by erroring out during plan. Default is `DELETE`.  Possible values are: * DELETE * PREVENT * ABANDON | none | None | None |

### private_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `is_private` | 'Indicate if it's private instance.' | true | None | None |
| `ca_pool` | CA pool resource, resource must in the format of `projects/{project}/locations/{location}/caPools/{ca_pool}`. | true | None | None |
| `http_service_attachment` | (Output) Service Attachment for HTTP, resource is in the format of `projects/{project}/regions/{region}/serviceAttachments/{service_attachment}`. | none | None | None |
| `ssh_service_attachment` | (Output) Service Attachment for SSH, resource is in the format of `projects/{project}/regions/{region}/serviceAttachments/{service_attachment}`. | none | None | None |

### workforce_identity_federation_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | 'Whether Workforce Identity Federation is enabled.' | true | None | None |
