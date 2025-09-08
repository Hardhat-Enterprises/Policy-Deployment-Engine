## 🛡️ Policy Deployment Engine: `dataplex_aspect_type`

This section provides a concise policy evaluation for the `dataplex_aspect_type` resource in GCP.

Reference: [Terraform Registry – dataplex_aspect_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_aspect_type)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Description of the AspectType. | false | None | None |
| `display_name` | User friendly display name. | false | None | None |
| `labels` | User-defined labels for the AspectType. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `metadata_template` | MetadataTemplate of the Aspect. | false | None | None |
| `location` | The location where aspect type will be created in. | false | None | None |
| `aspect_type_id` | The aspect type id of the aspect type. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
