## 🛡️ Policy Deployment Engine: `compute_region_commitment`

This section provides a concise policy evaluation for the `compute_region_commitment` resource in GCP.

Reference: [Terraform Registry – compute_region_commitment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_commitment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. The name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `plan` | The plan for this commitment, which determines duration and discount rate. The currently supported plans are TWELVE_MONTH (1 year), and THIRTY_SIX_MONTH (3 years). Possible values are: `TWELVE_MONTH`, `THIRTY_SIX_MONTH`. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `type` | The type of commitment, which affects the discount rate and the eligible resources. The type could be one of the following value: `MEMORY_OPTIMIZED`, `ACCELERATOR_OPTIMIZED`, `GENERAL_PURPOSE_N1`, `GENERAL_PURPOSE_N2`, `GENERAL_PURPOSE_N2D`, `GENERAL_PURPOSE_E2`, `GENERAL_PURPOSE_T2D`, `GENERAL_PURPOSE_C3`, `COMPUTE_OPTIMIZED_C2`, `COMPUTE_OPTIMIZED_C2D` and `GRAPHICS_OPTIMIZED_G2` | false | None | None |
| `category` | The category of the commitment. Category MACHINE specifies commitments composed of machine resources such as VCPU or MEMORY, listed in resources. Category LICENSE specifies commitments composed of software licenses, listed in licenseResources. Note that only MACHINE commitments should have a Type specified. Possible values are: `LICENSE`, `MACHINE`. | false | None | None |
| `auto_renew` | Specifies whether to enable automatic renewal for the commitment. The default value is false if not specified. If the field is set to true, the commitment will be automatically renewed for either one or three years according to the terms of the existing commitment. | false | None | None |
| `existing_reservations` | Specifies the already existing reservations to attach to the Commitment. | false | None | None |
| `region` | URL of the region where this commitment may be used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of resource for which this commitment applies. Possible values are VCPU, MEMORY, LOCAL_SSD, and ACCELERATOR. | false | None | None |
| `amount` | The amount of the resource purchased (in a type-dependent unit, such as bytes). For vCPUs, this can just be an integer. For memory, this must be provided in MB. Memory must be a multiple of 256 MB, with up to 6.5GB of memory per every vCPU. | false | None | None |
| `accelerator_type` | Name of the accelerator type resource. Applicable only when the type is ACCELERATOR. | false | None | None |

### license_resource Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `license` | Any applicable license URI. | true | None | None |
| `amount` | The number of licenses purchased. | false | None | None |
| `cores_per_license` | Specifies the core range of the instance for which this license applies. | false | None | None |
