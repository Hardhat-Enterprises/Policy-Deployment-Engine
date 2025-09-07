## 🛡️ Policy Deployment Engine: `compute_attached_disk`

This section provides a concise policy evaluation for the `compute_attached_disk` resource in GCP.

Reference: [Terraform Registry – compute_attached_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_attached_disk)

---

## 1. Argument Reference

### `instance`
- Description: (Required) `name` or `self_link` of the compute instance that the disk will be attached to. If the `self_link` is provided then `zone` and `project` are extracted from the self link. If only the name is used then `zone` and `project` must be defined as properties on the resource or provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk`
- Description: (Required) `name` or `self_link` of the disk that will be attached. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project that the referenced compute instance is a part of. If `instance` is referenced by its `self_link` the project defined in the link will take precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The zone that the referenced compute instance is located within. If `instance` is referenced by its `self_link` the zone defined in the link will take precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: (Optional) Specifies a unique device name of your choice that is reflected into the /dev/disk/by-id/google-* tree of a Linux operating system running within the instance. This name can be used to reference the device for mounting, resizing, and so on, from within the instance. If not specified, the server chooses a default device name to apply to this disk, in the form persistent-disks-x, where x is a number assigned by Google Compute Engine.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) The mode in which to attach this disk, either READ_WRITE or READ_ONLY. If not specified, the default is to attach the disk in READ_WRITE mode. Possible values: "READ_ONLY" "READ_WRITE"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Optional) The disk interface used for attaching this disk. This field is only used for specific cases, please don't specify this field without advice from Google. Not specifying the field will allow the the server to assign the correct interface. Possible values: "SCSI" "NVME"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
