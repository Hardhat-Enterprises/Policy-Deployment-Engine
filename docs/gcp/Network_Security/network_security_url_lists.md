## 🛡️ Policy Deployment Engine: `network_security_url_lists`

This section provides a concise policy evaluation for the `network_security_url_lists` resource in GCP.

Reference: [Terraform Registry – network_security_url_lists](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_url_lists)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `values` | FQDNs and URLs. | true | false | None | None | None |
| `name` | Short name of the UrlList resource to be created. This value should be 1-63 characters long, containing only letters, numbers, hyphens, and underscores, and should not start with a number. E.g. 'urlList'. | true | false | None | None | None |
| `location` | The location of the url lists. | true | false | None | None | None |
| `description` | Free-text description of the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
