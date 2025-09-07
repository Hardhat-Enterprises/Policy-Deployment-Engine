## 🛡️ Policy Deployment Engine: `apigee_organization`

This section provides a concise policy evaluation for the `apigee_organization` resource in GCP.

Reference: [Terraform Registry – apigee_organization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_organization)

---

## 1. Argument Reference

### `project_id`
- Description: (Required) The project ID associated with the Apigee organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the Apigee organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the Apigee organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `analytics_region`
- Description: (Optional) Primary GCP region for analytics data storage. For valid values, see [Create an Apigee organization](https://cloud.google.com/apigee/docs/api-platform/get-started/create-org).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_consumer_data_location`
- Description: (Optional) This field is needed only for customers using non-default data residency regions. Apigee stores some control plane data only in single region. This field determines which single region Apigee should use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_consumer_data_encryption_key_name`
- Description: (Optional) Cloud KMS key name used for encrypting API consumer data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_encryption_key_name`
- Description: (Optional) Cloud KMS key name used for encrypting control plane data that is stored in a multi region. Only used for the data residency region "US" or "EU".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_network`
- Description: (Optional) Compute Engine network used for Service Networking to be peered with Apigee runtime instances. See [Getting started with the Service Networking API](https://cloud.google.com/service-infrastructure/docs/service-networking/getting-started). Valid only when `RuntimeType` is set to CLOUD. The value can be updated only when there are no runtime instances. For example: "default".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_vpc_peering`
- Description: (Optional) Flag that specifies whether the VPC Peering through Private Google Access should be disabled between the consumer network and Apigee. Required if an `authorizedNetwork` on the consumer project is not provided, in which case the flag should be set to `true`. Valid only when `RuntimeType` is set to CLOUD. The value must be set before the creation of any Apigee runtime instance and can be updated only when there are no runtime instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_type`
- Description: (Optional) Runtime type of the Apigee organization based on the Apigee subscription purchased. Default value is `CLOUD`. Possible values are: `CLOUD`, `HYBRID`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `billing_type`
- Description: (Optional) Billing type of the Apigee organization. See [Apigee pricing](https://cloud.google.com/apigee/pricing).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_database_encryption_key_name`
- Description: (Optional) Cloud KMS key name used for encrypting the data that is stored and replicated across runtime instances. Update is not allowed after the organization is created. If not specified, a Google-Managed encryption key will be used. Valid only when `RuntimeType` is CLOUD. For example: `projects/foo/locations/us/keyRings/bar/cryptoKeys/baz`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Properties defined in the Apigee organization profile. Structure is [documented below](#nested_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention`
- Description: (Optional) Optional. This setting is applicable only for organizations that are soft-deleted (i.e., BillingType is not EVALUATION). It controls how long Organization data will be retained after the initial delete operation completes. During this period, the Organization may be restored to its last known state. After this period, the Organization will no longer be able to be restored. Default value is `DELETION_RETENTION_UNSPECIFIED`. Possible values are: `DELETION_RETENTION_UNSPECIFIED`, `MINIMUM`. <a name="nested_properties"></a>The `properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `property`
- Description: (Optional) List of all properties in the object. Structure is [documented below](#nested_properties_property). <a name="nested_properties_property"></a>The `property` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
