## 🛡️ Policy Deployment Engine: `filestore_backup`

This section provides a concise policy evaluation for the `filestore_backup` resource in GCP.

Reference: [Terraform Registry – filestore_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/filestore_backup)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the backup. The name must be unique within the specified instance. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `source_instance` | The resource name of the source Cloud Filestore instance, in the format projects/{projectId}/locations/{locationId}/instances/{instanceId}, used to create this backup. | true | None | None |
| `source_file_share` | Name of the file share in the source Cloud Filestore instance that the backup is created from. | true | None | None |
| `location` | The name of the location of the instance. This can be a region for ENTERPRISE tier instances. | true | None | None |
| `description` | A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected. | false | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `tags` | A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/{tag_value_id}. The field is ignored (both PUT & PATCH) when empty. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
