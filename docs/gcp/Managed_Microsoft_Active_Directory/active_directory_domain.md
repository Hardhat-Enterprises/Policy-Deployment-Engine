## 🛡️ Policy Deployment Engine: `active_directory_domain`

This section provides a concise policy evaluation for the `active_directory_domain` resource in GCP.

Reference: [Terraform Registry – active_directory_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/active_directory_domain)

---

## 1. Argument Reference

### `reserved_ip_range`
- Description: (Required) The CIDR range of internal addresses that are reserved for this domain. Reserved networks must be /24 or larger. Ranges must be unique and non-overlapping with existing subnets in authorizedNetworks
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locations`
- Description: (Required) Locations where domain needs to be provisioned. [regions][compute/docs/regions-zones/] e.g. us-west1 or us-east4 Service supports up to 4 locations at once. Each location will use a /26 block.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_name`
- Description: (Required) The fully qualified domain name. e.g. mydomain.myorganization.com, with the restrictions of https://cloud.google.com/managed-microsoft-ad/reference/rest/v1/projects.locations.global.domains.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels that can contain user-provided metadata **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_networks`
- Description: (Optional) The full names of the Google Compute Engine networks the domain instance is connected to. The domain is only available on networks listed in authorizedNetworks. If CIDR subnets overlap between networks, domain creation will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin`
- Description: (Optional) The name of delegated administrator account used to perform Active Directory operations. If not specified, setupadmin will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When a`terraform destroy` or `terraform apply` would delete the domain, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the domain will fail. When the field is set to false, deleting the domain is allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
