## 🛡️ Policy Deployment Engine: `certificate_manager_dns_authorization`

This section provides a concise policy evaluation for the `certificate_manager_dns_authorization` resource in GCP.

Reference: [Terraform Registry – certificate_manager_dns_authorization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_dns_authorization)

---

## 1. Argument Reference

### `domain`
- Description: (Required) A domain which is being authorized. A DnsAuthorization resource covers a single domain and its wildcard, e.g. authorization for "example.com" can be used to issue certificates for "example.com" and "*.example.com".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the resource; provided by the client when the resource is created. The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the DNS Authorization resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) type of DNS authorization. If unset during the resource creation, FIXED_RECORD will be used for global resources, and PER_PROJECT_RECORD will be used for other locations. FIXED_RECORD DNS authorization uses DNS-01 validation method PER_PROJECT_RECORD DNS authorization allows for independent management of Google-managed certificates with DNS authorization across multiple projects. Possible values are: `FIXED_RECORD`, `PER_PROJECT_RECORD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The Certificate Manager location. If not specified, "global" is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
