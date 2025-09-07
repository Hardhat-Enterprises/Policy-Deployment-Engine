## 🛡️ Policy Deployment Engine: `compute_instance_from_template`

This section provides a concise policy evaluation for the `compute_instance_from_template` resource in GCP.

Reference: [Terraform Registry – compute_instance_from_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_from_template)

---

## 1. Argument Reference

### `name`
- Description: Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_instance_template`
- Description: template to create the instance based on. It is recommended to reference instance templates through their unique id (`self_link_unique` attribute). - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: set, the provider zone is used. In addition to these, all arguments from `google_compute_instance` are supported as a way to override the properties in the template. All exported attributes from `google_compute_instance` are likewise exported here. To support removal of Optional/Computed fields in Terraform 0.12 the following fields are marked [Attributes as Blocks](/docs/configuration/attr-as-blocks.html):
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
