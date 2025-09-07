## 🛡️ Policy Deployment Engine: `compute_region_commitment`

This section provides a concise policy evaluation for the `compute_region_commitment` resource in GCP.

Reference: [Terraform Registry – compute_region_commitment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_commitment)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plan`
- Description: (Required) The plan for this commitment, which determines duration and discount rate. The currently supported plans are TWELVE_MONTH (1 year), and THIRTY_SIX_MONTH (3 years). Possible values are: `TWELVE_MONTH`, `THIRTY_SIX_MONTH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resources`
- Description: (Optional) A list of commitment amounts for particular resources. Note that VCPU and MEMORY resource commitments must occur together. Structure is [documented below](#nested_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of commitment, which affects the discount rate and the eligible resources. The type could be one of the following value: `MEMORY_OPTIMIZED`, `ACCELERATOR_OPTIMIZED`, `GENERAL_PURPOSE_N1`, `GENERAL_PURPOSE_N2`, `GENERAL_PURPOSE_N2D`, `GENERAL_PURPOSE_E2`, `GENERAL_PURPOSE_T2D`, `GENERAL_PURPOSE_C3`, `COMPUTE_OPTIMIZED_C2`, `COMPUTE_OPTIMIZED_C2D` and `GRAPHICS_OPTIMIZED_G2`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `category`
- Description: (Optional) The category of the commitment. Category MACHINE specifies commitments composed of machine resources such as VCPU or MEMORY, listed in resources. Category LICENSE specifies commitments composed of software licenses, listed in licenseResources. Note that only MACHINE commitments should have a Type specified. Possible values are: `LICENSE`, `MACHINE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `license_resource`
- Description: (Optional) The license specification required as part of a license commitment. Structure is [documented below](#nested_license_resource).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_renew`
- Description: (Optional) Specifies whether to enable automatic renewal for the commitment. The default value is false if not specified. If the field is set to true, the commitment will be automatically renewed for either one or three years according to the terms of the existing commitment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `existing_reservations`
- Description: (Optional) Specifies the already existing reservations to attach to the Commitment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) URL of the region where this commitment may be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_resources"></a>The `resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Type of resource for which this commitment applies. Possible values are VCPU, MEMORY, LOCAL_SSD, and ACCELERATOR.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `amount`
- Description: (Optional) The amount of the resource purchased (in a type-dependent unit, such as bytes). For vCPUs, this can just be an integer. For memory, this must be provided in MB. Memory must be a multiple of 256 MB, with up to 6.5GB of memory per every vCPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) Name of the accelerator type resource. Applicable only when the type is ACCELERATOR. <a name="nested_license_resource"></a>The `license_resource` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `license`
- Description: (Required) Any applicable license URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `amount`
- Description: (Optional) The number of licenses purchased.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cores_per_license`
- Description: (Optional) Specifies the core range of the instance for which this license applies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
