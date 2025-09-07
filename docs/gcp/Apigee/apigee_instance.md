## 🛡️ Policy Deployment Engine: `apigee_instance`

This section provides a concise policy evaluation for the `apigee_instance` resource in GCP.

Reference: [Terraform Registry – apigee_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) Resource ID of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Required. Compute Engine location where the instance resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering_cidr_range`
- Description: (Optional) The size of the CIDR block range that will be reserved by the instance. For valid values, see [CidrRange](https://cloud.google.com/apigee/docs/reference/apis/apigee/rest/v1/organizations.instances#CidrRange) on the documentation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_range`
- Description: (Optional) IP range represents the customer-provided CIDR block of length 22 that will be used for the Apigee instance creation. This optional range, if provided, should be freely available as part of larger named range the customer has allocated to the Service Networking peering. If this is not provided, Apigee will automatically request for any available /22 CIDR block from Service Networking. The customer should use this CIDR block for configuring their firewall needs to allow traffic from Apigee. Input format: "a.b.c.d/22"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display name of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key_name`
- Description: (Optional) Customer Managed Encryption Key (CMEK) used for disk and volume encryption. Required for Apigee paid subscriptions only. Use the following format: `projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_accept_list`
- Description: (Optional) Optional. Customer accept list represents the list of projects (id/number) on customer side that can privately connect to the service attachment. It is an optional field which the customers can provide during the instance creation. By default, the customer project associated with the Apigee organization will be included to the list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_logging_config`
- Description: (Optional) Access logging configuration enables the access logging feature at the instance. Apigee customers can enable access logging to ship the access logs to their own project's cloud logging. Structure is [documented below](#nested_access_logging_config). <a name="nested_access_logging_config"></a>The `access_logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Boolean flag that specifies whether the customer access log feature is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) Ship the access log entries that match the statusCode defined in the filter. The statusCode is the only expected/supported filter field. (Ex: statusCode) The filter will parse it to the Common Expression Language semantics for expression evaluation to build the filter condition. (Ex: "filter": statusCode >= 200 && statusCode < 300 )
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
