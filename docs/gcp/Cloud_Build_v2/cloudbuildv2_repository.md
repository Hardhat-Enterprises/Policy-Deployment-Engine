## 🛡️ Policy Deployment Engine: `cloudbuildv2_repository`

This section provides a concise policy evaluation for the `cloudbuildv2_repository` resource in GCP.

Reference: [Terraform Registry – cloudbuildv2_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_repository)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the repository. | true | None | None |
| `remote_uri` | Required. Git Clone HTTPS URI. | true | None | None |
| `parent_connection` | The connection for the resource | true | None | None |
| `annotations` | Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `location` | The location for the resource | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
