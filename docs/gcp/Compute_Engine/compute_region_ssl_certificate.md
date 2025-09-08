## 🛡️ Policy Deployment Engine: `compute_region_ssl_certificate`

This section provides a concise policy evaluation for the `compute_region_ssl_certificate` resource in GCP.

Reference: [Terraform Registry – compute_region_ssl_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_ssl_certificate)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `certificate` | The certificate in PEM format. The certificate chain must be no greater than 5 certs long. The chain must include at least one intermediate cert. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `private_key` | The write-only private key in PEM format. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. These are in the same namespace as the managed SSL certificates. | false | None | None |
| `region` | The Region in which the created regional ssl certificate should reside. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `name_prefix` | specified prefix. Conflicts with `name`. Max length is 54 characters. Prefixes with lengths longer than 37 characters will use a shortened UUID that will be more prone to collisions. Resulting name for a `name_prefix` <= 37 characters: `name_prefix` + YYYYmmddHHSSssss + 8 digit incremental counter Resulting name for a `name_prefix` 38 - 54 characters: `name_prefix` + YYmmdd + 3 digit incremental counter | none | None | None |
