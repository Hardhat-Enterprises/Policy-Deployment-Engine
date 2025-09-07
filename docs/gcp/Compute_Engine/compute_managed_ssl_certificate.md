## 🛡️ Policy Deployment Engine: `compute_managed_ssl_certificate`

This section provides a concise policy evaluation for the `compute_managed_ssl_certificate` resource in GCP.

Reference: [Terraform Registry – compute_managed_ssl_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_managed_ssl_certificate)

---

## 1. Argument Reference

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. These are in the same namespace as the managed SSL certificates.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed`
- Description: (Optional) Properties relevant to a managed certificate.  These will be used if the certificate is managed (as indicated by a value of `MANAGED` in `type`). Structure is [documented below](#nested_managed).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Enum field whose value is always `MANAGED` - used to signal to the API which type this is. Default value is `MANAGED`. Possible values are: `MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_managed"></a>The `managed` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domains`
- Description: (Required) Domains for which a managed SSL certificate will be valid.  Currently, there can be up to 100 domains in this list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
