## 🛡️ Policy Deployment Engine: `filestore_snapshot`

This section provides a concise policy evaluation for the `filestore_snapshot` resource in GCP.

Reference: [Terraform Registry – filestore_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/filestore_snapshot)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the snapshot. The name must be unique within the specified instance. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `location` | The name of the location of the instance. This can be a region for ENTERPRISE tier instances. | true | None | None |
| `instance` | The resource name of the filestore instance. | true | None | None |
| `description` | A description of the snapshot with 2048 characters or less. Requests with longer descriptions will be rejected. | false | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
