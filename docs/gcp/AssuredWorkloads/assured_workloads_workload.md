## 🛡️ Policy Deployment Engine: `assured_workloads_workload`

This section provides a concise policy evaluation for the `assured_workloads_workload` resource in GCP.

Reference: [Terraform Registry – assured_workloads_workload](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/assured_workloads_workload)

---

## 1. Argument Reference

### `compliance_regime`
- Description: (Required) Required. Immutable. Compliance Regime associated with this workload. Possible values: COMPLIANCE_REGIME_UNSPECIFIED, IL4, CJIS, FEDRAMP_HIGH, FEDRAMP_MODERATE, US_REGIONAL_ACCESS, HIPAA, HITRUST, EU_REGIONS_AND_SUPPORT, CA_REGIONS_AND_SUPPORT, ITAR, AU_REGIONS_AND_US_SUPPORT, ASSURED_WORKLOADS_FOR_PARTNERS, ISR_REGIONS, ISR_REGIONS_AND_SUPPORT, CA_PROTECTED_B, IL5, IL2, JP_REGIONS_AND_SUPPORT, KSA_REGIONS_AND_SUPPORT_WITH_SOVEREIGNTY_CONTROLS, REGIONAL_CONTROLS, HEALTHCARE_AND_LIFE_SCIENCES_CONTROLS, HEALTHCARE_AND_LIFE_SCIENCES_CONTROLS_US_SUPPORT, IRS_1075
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Required. The user-assigned display name of the Workload. When present it must be between 4 to 30 characters. Allowed characters are: lowercase and uppercase letters, numbers, hyphen, and spaces. Example: My Workload
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Required) The organization for the resource - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `billing_account`
- Description: (Optional) Optional. Input only. The billing account used for the resources which are direct children of workload. This billing account is initially associated with the resources created as part of Workload creation. After the initial creation of these resources, the customer can change the assigned billing account. The resource name has the form `billingAccounts/{billing_account_id}`. For example, `billingAccounts/012345-567890-ABCDEF`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_sovereign_controls`
- Description: (Optional) Optional. Indicates the sovereignty status of the given workload. Currently meant to be used by Europe/Canada customers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_settings`
- Description: (Optional) **DEPRECATED** Input only. Settings used to create a CMEK crypto key. When set, a project with a KMS CMEK key is provisioned. This field is deprecated as of Feb 28, 2022. In order to create a Keyring, callers should specify, ENCRYPTION_KEYS_PROJECT or KEYRING in ResourceSettings.resource_type field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels applied to the workload. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partner`
- Description: (Optional) Optional. Partner regime associated with this workload. Possible values: PARTNER_UNSPECIFIED, LOCAL_CONTROLS_BY_S3NS, SOVEREIGN_CONTROLS_BY_T_SYSTEMS, SOVEREIGN_CONTROLS_BY_SIA_MINSAIT, SOVEREIGN_CONTROLS_BY_PSN, SOVEREIGN_CONTROLS_BY_CNTXT, SOVEREIGN_CONTROLS_BY_CNTXT_NO_EKM
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partner_permissions`
- Description: (Optional) Optional. Permissions granted to the AW Partner SA account for the customer workload
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partner_services_billing_account`
- Description: (Optional) Optional. Input only. Billing account necessary for purchasing services from Sovereign Partners. This field is required for creating SIA/PSN/CNTXT partner workloads. The caller should have 'billing.resourceAssociations.create' IAM permission on this billing-account. The format of this string is billingAccounts/AAAAAA-BBBBBB-CCCCCC.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_resources_parent`
- Description: (Optional) Input only. The parent resource for the resources managed by this Assured Workload. May be either empty or a folder resource which is a child of the Workload parent. If not specified all resources are created under the parent organization. Format: folders/{folder_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_settings`
- Description: (Optional) Input only. Resource properties that are used to customize workload resources. These properties (such as custom project id) will be used to create workload resources if possible. This field is optional.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `violation_notifications_enabled`
- Description: (Optional) Optional. Indicates whether the e-mail notification for a violation is enabled for a workload. This value will be by default True, and if not present will be considered as true. This should only be updated via updateWorkload call. Any Changes to this field during the createWorkload call will not be honored. This will always be true while creating the workload.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_options`
- Description: (Optional) Optional. Used to specify certain options for a workload during workload creation - currently only supporting KAT Optionality for Regional Controls workloads.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `kms_settings` Block

### `next_rotation_time`
- Description: (Required) Required. Input only. Immutable. The time at which the Key Management Service will automatically create a new version of the crypto key and mark it as the primary.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rotation_period`
- Description: (Required) Required. Input only. Immutable. will be advanced by this period when the Key Management Service automatically rotates a key. Must be at least 24 hours and at most 876,000 hours.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `partner_permissions` Block

### `assured_workloads_monitoring`
- Description: (Optional) Optional. Allow partner to view violation alerts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_logs_viewer`
- Description: (Optional) Allow the partner to view inspectability logs and monitoring violations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_access_approver`
- Description: (Optional) Optional. Allow partner to view access approval logs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `resource_settings` Block

### `display_name`
- Description: (Optional) User-assigned resource display name. If not empty it will be used to create a resource with the specified name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_id`
- Description: (Optional) Resource identifier. For a project this represents projectId. If the project is already taken, the workload creation will fail. For KeyRing, this represents the keyring_id. For a folder, don't set this value as folder_id is assigned by Google.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: (Optional) Indicates the type of resource. This field should be specified to correspond the id to the right project type (CONSUMER_PROJECT or ENCRYPTION_KEYS_PROJECT) Possible values: RESOURCE_TYPE_UNSPECIFIED, CONSUMER_PROJECT, ENCRYPTION_KEYS_PROJECT, KEYRING, CONSUMER_FOLDER
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `workload_options` Block

### `kaj_enrollment_type`
- Description: (Optional) Indicates type of KAJ enrollment for the workload. Currently, only specifiying KEY_ACCESS_TRANSPARENCY_OFF is implemented to not enroll in KAT-level KAJ enrollment for Regional Controls workloads. Possible values: KAJ_ENROLLMENT_TYPE_UNSPECIFIED, FULL_KAJ, EKM_ONLY, KEY_ACCESS_TRANSPARENCY_OFF
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
