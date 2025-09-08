## 🛡️ Policy Deployment Engine: `compute_managed_ssl_certificate`

This section provides a concise policy evaluation for the `compute_managed_ssl_certificate` resource in GCP.

Reference: [Terraform Registry – compute_managed_ssl_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_managed_ssl_certificate)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | An optional description of this resource. | false | None | None |
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. These are in the same namespace as the managed SSL certificates. | false | None | None |
| `type` | Enum field whose value is always `MANAGED` - used to signal to the API which type this is. Default value is `MANAGED`. Possible values are: `MANAGED`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### managed Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domains` | Domains for which a managed SSL certificate will be valid.  Currently, there can be up to 100 domains in this list. | true | None | None |
