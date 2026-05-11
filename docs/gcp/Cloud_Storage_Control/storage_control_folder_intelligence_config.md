## 🛡️ Policy Deployment Engine: `storage_control_folder_intelligence_config`

This section provides a concise policy evaluation for the `storage_control_folder_intelligence_config` resource in GCP.

Reference: [Terraform Registry – storage_control_folder_intelligence_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_control_folder_intelligence_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Identifier of the GCP Folder. For GCP Folder, this field can be folder number. | true | false | This is a required identifier field used to reference the GCP Folder. It does not control any security behaviour or access permissions. | None | None |
| `edition_config` | Edition configuration of the Storage Intelligence resource. Valid values are INHERIT, TRIAL, DISABLED and STANDARD. | false | true | Setting edition_config to DISABLED removes Storage Intelligence monitoring at the folder level, eliminating security visibility, anomaly detection, and compliance monitoring across all buckets within the folder. | STANDARD | DISABLED |
| `filter` | Filter over location and bucket using include or exclude semantics. Resources that match the include or exclude filter are exclusively included or excluded from the Storage Intelligence plan. Structure is [documented below](#nested_filter). | false | true | The filter block controls the scope of Storage Intelligence monitoring. Misconfigured filters can exclude sensitive buckets or unapproved locations from monitoring coverage, creating security blind spots. | None | None |
| `excluded_cloud_storage_buckets` |  | false | false | This is a nested block supporting the filter argument. Excluding buckets from monitoring is an operational decision and does not directly enforce a security control. | None | None |
| `included_cloud_storage_buckets` |  | false | false | This is a nested block supporting the filter argument. Including specific buckets in monitoring is an operational scoping decision and does not directly enforce a security control. | None | None |
| `excluded_cloud_storage_locations` |  | false | false | This is a nested block supporting the filter argument. Excluding locations from monitoring is an operational and cost management decision, not a security control. | None | None |
| `included_cloud_storage_locations` |  | false | true | This nested block enforces data sovereignty by restricting Storage Intelligence monitoring to approved GCP regions only. | None | None |

### filter Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `excluded_cloud_storage_buckets` | Buckets to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_buckets). | false | false | None | None | None |
| `included_cloud_storage_buckets` | Buckets to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_buckets). | false | false | Including specific buckets in Storage Intelligence is an operational scoping decision. Without a defined organisational bucket naming convention, this field cannot be enforced as a security policy. | None | None |
| `excluded_cloud_storage_locations` | Locations to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_locations). | false | false | Excluding locations from Storage Intelligence monitoring is an operational and cost management decision. It does not directly affect access control or data protection and is therefore not considered a security policy. | None | None |
| `included_cloud_storage_locations` | Locations to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_locations). | false | true | Restricting Storage Intelligence monitoring to approved regions enforces data sovereignty requirements. Monitoring buckets outside approved regions may expose sensitive data patterns beyond approved geographic boundaries, violating regulatory obligations such as IRAP. | None | None |

### excluded_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_id_regexes` | List of bucket id regexes to exclude in the storage intelligence plan. | true | false | Bucket exclusion regexes are operational scoping patterns. Without defined organisational bucket naming conventions, these cannot be enforced as a security policy. | None | None |

### included_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_id_regexes` | List of bucket id regexes to exclude in the storage intelligence plan. | true | false | Bucket inclusion regexes are operational scoping patterns. Without defined organisational bucket naming conventions, these cannot be enforced as a security policy. | None | None |

### excluded_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | List of locations. | true | false | Location exclusion values are operational scope decisions. They do not enforce data protection or access control and are therefore not considered security relevant. | None | None |

### included_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | List of locations. | true | true | Storage Intelligence must only monitor buckets within approved Australian regions to comply with data sovereignty and regulatory requirements such as IRAP. Monitoring buckets in unapproved regions risks exposing sensitive data patterns outside approved geographic boundaries. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'europe-west1'] |
