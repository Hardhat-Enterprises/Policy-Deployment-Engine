## 🛡️ Policy Deployment Engine: `assured_workloads_workload`

This section provides a concise policy evaluation for the `assured_workloads_workload` resource in GCP.

Reference: [Terraform Registry – assured_workloads_workload](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/assured_workloads_workload)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `compliance_regime` | Required. Immutable. Compliance Regime associated with this workload. Possible values: COMPLIANCE_REGIME_UNSPECIFIED, IL4, CJIS, FEDRAMP_HIGH, FEDRAMP_MODERATE, US_REGIONAL_ACCESS, HIPAA, HITRUST, EU_REGIONS_AND_SUPPORT, CA_REGIONS_AND_SUPPORT, ITAR, AU_REGIONS_AND_US_SUPPORT, ASSURED_WORKLOADS_FOR_PARTNERS, ISR_REGIONS, ISR_REGIONS_AND_SUPPORT, CA_PROTECTED_B, IL5, IL2, JP_REGIONS_AND_SUPPORT, KSA_REGIONS_AND_SUPPORT_WITH_SOVEREIGNTY_CONTROLS, REGIONAL_CONTROLS, HEALTHCARE_AND_LIFE_SCIENCES_CONTROLS, HEALTHCARE_AND_LIFE_SCIENCES_CONTROLS_US_SUPPORT, IRS_1075 | true | true | The compliance regime defines the regulatory framework enforced on the workload. Using an unapproved or unspecified regime means the workload may not meet required security and compliance standards, exposing sensitive data to risk. | FEDRAMP_MODERATE | COMPLIANCE_REGIME_UNSPECIFIED |
| `display_name` | Required. The user-assigned display name of the Workload. | true | false | Display name is used for identification purposes only and does not impact the security of the workload. | None | None |
| `location` | The location for the resource | true | true | The location determines where data is stored and processed. Selecting an incorrect region may violate data residency requirements. | australia-southeast1 | us-central1 |
| `organization` | The organization for the resource | true | false | The organization ID associates the workload with the correct GCP organization and does not directly impact security. | None | None |
| `billing_account` | Optional. The billing account used for the resources which are direct children of workload. | false | false | The billing account is used for cost tracking only and does not affect the security posture of the workload. | None | None |
| `enable_sovereign_controls` | Optional. Indicates the sovereignty status of the given workload. Currently meant to be used by Europe/Canada customers. | false | true | Sovereign controls enforce data residency and personnel access restrictions required by certain regional regulations. Disabling sovereign controls on workloads that require them may result in non-compliance with local data protection laws. | True | False |
| `kms_settings` | Input only. Settings used to create a CMEK crypto key. When set, a project with a KMS CMEK key is provisioned. | false | true | KMS settings control how encryption keys are managed. Proper key rotation reduces the risk of key compromise and ensures data remains protected over time. | Refer to child arguments | Refer to child arguments |
| `labels` | Optional. Labels applied to the workload. | false | false | Labels are used for resource organisation and cost tracking and do not affect the security of the workload. | None | None |
| `partner` | Optional. Partner regime associated with this workload. | false | true | The partner regime determines which third-party sovereign controls are applied. An unspecified partner regime may result in inadequate data protection for regulated workloads. | None | PARTNER_UNSPECIFIED |
| `partner_permissions` | Optional. Permissions granted to the AW Partner SA account for the customer workload | false | true | Partner permissions control what the partner can access. Enabling appropriate monitoring permissions ensures compliance violations are visible and actionable. | Refer to child arguments | Refer to child arguments |
| `violation_notifications_enabled` | Optional. Indicates whether the e-mail notification for a violation is enabled for a workload. | false | true | Violation notifications alert administrators when compliance violations occur. Disabling this means violations may go undetected, increasing the risk of prolonged non-compliance. | True | False |
| `workload_options` | Optional. Used to specify certain options for a workload during workload creation. | false | false | Workload options configure KAJ enrollment type and do not directly affect the general security posture of the workload. | None | None |

### kms_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `next_rotation_time` | Required. The time at which KMS will automatically create a new version of the crypto key. | true | true | Setting a next rotation time ensures the encryption key is rotated on schedule, reducing the window of exposure if a key is compromised. | 9999-10-02T15:01:23Z | None |
| `rotation_period` | Required. Period by which KMS automatically rotates a key. Must be at least 24 hours and at most 876,000 hours. | true | true | A shorter rotation period reduces the risk of long-term key exposure. Keys should be rotated at least every 90 days (7776000 seconds) to meet security best practices. | 7776000s | 31536000s |

### partner_permissions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `assured_workloads_monitoring` | Optional. Allow partner to view violation alerts. | false | true | Enabling assured workloads monitoring allows the partner to detect and respond to compliance violations. Disabling this means violations may go undetected. | True | False |
| `data_logs_viewer` | Allow the partner to view inspectability logs and monitoring violations. | false | true | Access to inspectability logs enables partners to audit data access and detect anomalies. | True | False |
| `service_access_approver` | Optional. Allow partner to view access approval logs. | false | true | Access approval logs provide an audit trail of who accessed customer data, supporting accountability and compliance auditing. | True | False |

### workload_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kaj_enrollment_type` | Indicates type of KAJ enrollment for the workload. | false | false | KAJ enrollment type determines the level of Key Access Justifications transparency for Regional Controls workloads. | None | None |
