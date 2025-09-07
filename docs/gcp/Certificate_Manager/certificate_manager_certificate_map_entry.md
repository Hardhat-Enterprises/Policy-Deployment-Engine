## 🛡️ Policy Deployment Engine: `certificate_manager_certificate_map_entry`

This section provides a concise policy evaluation for the `certificate_manager_certificate_map_entry` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate_map_entry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map_entry)

---

## 1. Argument Reference

### `certificates`
- Description: (Required) A set of Certificates defines for the given hostname. There can be defined up to fifteen certificates in each Certificate Map Entry. Each certificate must match pattern projects/*/locations/*/certificates/*.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) A user-defined name of the Certificate Map Entry. Certificate Map Entry names must be unique globally and match pattern 'projects/*/locations/*/certificateMaps/*/certificateMapEntries/*'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `map`
- Description: (Required) A map entry that is inputted into the cetrificate map
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of labels associated with a Certificate Map Entry. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Optional) A Hostname (FQDN, e.g. example.com) or a wildcard hostname expression (*.example.com) for a set of hostnames with common suffix. Used as Server Name Indication (SNI) for selecting a proper certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matcher`
- Description: (Optional) A predefined matcher for particular cases, other than SNI selection
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
