## 🛡️ Policy Deployment Engine: `network_security_url_lists`

This section provides a concise policy evaluation for the `network_security_url_lists` resource in GCP.

Reference: [Terraform Registry – network_security_url_lists](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_url_lists)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `values` | FQDNs and URLs. | true | None | None |
| `name` | Short name of the UrlList resource to be created. This value should be 1-63 characters long, containing only letters, numbers, hyphens, and underscores, and should not start with a number. E.g. 'urlList'. | true | None | None |
| `location` | The location of the url lists. | true | None | None |
| `description` | Free-text description of the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
