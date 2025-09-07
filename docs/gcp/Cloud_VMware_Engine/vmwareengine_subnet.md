## 🛡️ Policy Deployment Engine: `vmwareengine_subnet`

This section provides a concise policy evaluation for the `vmwareengine_subnet` resource in GCP.

Reference: [Terraform Registry – vmwareengine_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_subnet)

---

## 1. Argument Reference

### `ip_cidr_range`
- Description: (Required) The IP address range of the subnet in CIDR format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The resource name of the private cloud to create a new subnet in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the subnet. For userDefined subnets, this name should be in the format of "service-n", where n ranges from 1 to 5.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
