## 🛡️ Policy Deployment Engine: `network_security_url_lists`

This section provides a concise policy evaluation for the `network_security_url_lists` resource in GCP.

Reference: [Terraform Registry – network_security_url_lists](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_url_lists)

---

## 1. Argument Reference

### `values`
- Description: (Required) FQDNs and URLs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Short name of the UrlList resource to be created. This value should be 1-63 characters long, containing only letters, numbers, hyphens, and underscores, and should not start with a number. E.g. 'urlList'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the url lists.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Free-text description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
