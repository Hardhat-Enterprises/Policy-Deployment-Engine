## 🛡️ Policy Deployment Engine: `compute_instant_snapshot`

This section provides a concise policy evaluation for the `compute_instant_snapshot` resource in GCP.

Reference: [Terraform Registry – compute_instant_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instant_snapshot)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `source_disk` | A reference to the disk used to create this instant snapshot. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `labels` | Labels to apply to this InstantSnapshot. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `zone` | A reference to the zone where the disk is located. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
