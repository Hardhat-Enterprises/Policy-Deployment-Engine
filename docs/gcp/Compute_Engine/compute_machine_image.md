## 🛡️ Policy Deployment Engine: `compute_machine_image`

This section provides a concise policy evaluation for the `compute_machine_image` resource in GCP.

Reference: [Terraform Registry – compute_machine_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_machine_image)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_instance`
- Description: (Required) The source instance used to create the machine image. You can provide this as a partial or full URL to the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A text description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_flush`
- Description: (Optional) Specify this to create an application consistent machine image by informing the OS to prepare for the snapshot process. Currently only supported on Windows instances using the Volume Shadow Copy Service (VSS).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_image_encryption_key`
- Description: (Optional) Encrypts the machine image using a customer-supplied encryption key. After you encrypt a machine image with a customer-supplied key, you must provide the same key if you use the machine image later (e.g. to create a instance from the image) Structure is [documented below](#nested_machine_image_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_machine_image_encryption_key"></a>The `machine_image_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256`
- Description: (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The name of the encryption key that is stored in Google Cloud KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
