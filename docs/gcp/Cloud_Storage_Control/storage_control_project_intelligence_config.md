## 🛡️ Policy Deployment Engine: `storage_control_project_intelligence_config`

This section provides a concise policy evaluation for the `storage_control_project_intelligence_config` resource in GCP.

Reference: [Terraform Registry – storage_control_project_intelligence_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_control_project_intelligence_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Identifier of the GCP project. For GCP project, this field can be project name or project number. | true | false | This is a required identifier field used to reference the GCP Project. It does not control any security behaviour or access permissions. | None | None |
| `edition_config` | Edition configuration of the Storage Intelligence resource. Valid values are INHERIT, TRIAL, DISABLED and STANDARD. | false | true | Setting edition_config to DISABLED removes Storage Intelligence monitoring at the project level, eliminating security visibility, anomaly detection, and compliance monitoring across all buckets within the project. Storage Intelligence must remain active to maintain security coverage at the project level. | STANDARD | DISABLED |
| `filter` | Filter over location and bucket using include or exclude semantics. Resources that match the include or exclude filter are exclusively included or excluded from the Storage Intelligence plan. | false | false | At the project level, location filtering is not considered a security policy because the project can inherit location restrictions from the parent folder or organization where data sovereignty policies are already enforced. Configuring filters at the project level is an operational scoping decision. | None | None |
| `excluded_cloud_storage_buckets` |  | false | false | This is a nested block supporting the filter argument. Bucket exclusions are operational decisions and are not considered security-relevant at the project level. | None | None |
| `included_cloud_storage_buckets` |  | false | false | This is a nested block supporting the filter argument. Bucket inclusions are operational decisions and are not considered security-relevant at the project level. | None | None |
| `excluded_cloud_storage_locations` |  | false | false | This is a nested block supporting the filter argument. Location exclusions are operational decisions at the project level. Data sovereignty is enforced at the parent folder or organization level. | None | None |
| `included_cloud_storage_locations` |  | false | false | This nested block is not considered a security policy at the project level. Location restrictions are inherited from the parent folder or organization where data sovereignty policies are already enforced. | None | None |

### filter Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `excluded_cloud_storage_buckets` | Buckets to exclude from the Storage Intelligence plan. | false | false | Excluding specific buckets from Storage Intelligence monitoring is an operational scoping decision. Location and monitoring policies are inherited from the parent folder or organization. | None | None |
| `included_cloud_storage_buckets` | Buckets to include in the Storage Intelligence plan. | false | false | Including specific buckets is an operational scoping decision. It does not directly impact security posture at the project level. | None | None |
| `excluded_cloud_storage_locations` | Locations to exclude from the Storage Intelligence plan. | false | false | Excluding locations is an operational and cost management decision at the project level. Data sovereignty is enforced at the parent folder or organization level. | None | None |
| `included_cloud_storage_locations` | Locations to include in the Storage Intelligence plan. | false | false | At the project level, location restrictions are inherited from the parent folder or organization where data sovereignty policies are already enforced. Configuring locations at the project level is therefore not considered a security policy. | None | None |

### excluded_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_id_regexes` | List of bucket id regexes to exclude in the storage intelligence plan. | true | false | Regex patterns for bucket exclusions are operational scoping values. No security policy is enforced at this level. | None | None |

### included_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_id_regexes` | List of bucket id regexes to include in the storage intelligence plan. | true | false | Regex patterns for bucket inclusions are operational scoping values. No security policy is enforced at this level. | None | None |

### excluded_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | List of locations to exclude from the Storage Intelligence plan. | true | false | The list of excluded locations is an operational scoping value at the project level. No security policy is enforced here. | None | None |

### included_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | List of locations to include in the Storage Intelligence plan. | true | false | Location values at the project level are not enforced as a security policy. Data sovereignty requirements are managed at the parent folder or organization level via the intelligence_by_locations policy. | None | None |
