## 🛡️ Policy Deployment Engine: `storage_control_organization_intelligence_config`

This section provides a concise policy evaluation for the `storage_control_organization_intelligence_config` resource in GCP.

Reference: [Terraform Registry – storage_control_organization_intelligence_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_control_organization_intelligence_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Identifier of the GCP Organization. For GCP org, this field should be organization number. | true | false | This is a required identifier field used to reference the GCP Folder. It does not control any security behaviour or access permissions. | None | None |
| `edition_config` | Edition configuration of the Storage Intelligence resource. Valid values are INHERIT, TRIAL, DISABLED and STANDARD. | false | true | Setting edition_config to DISABLED removes Storage Intelligence monitoring at the organization level, eliminating security visibility, anomaly detection, and compliance monitoring across ALL folders, projects and buckets within the organization. This has a wider blast radius than folder or project level. Storage Intelligence must remain active to maintain security coverage. | STANDARD | DISABLED |
| `filter` | Filter over location and bucket using include or exclude semantics. Resources that match the include or exclude filter are exclusively included or excluded from the Storage Intelligence plan. Structure is [documented below](#nested_filter). | false | true | The filter block controls the scope of Storage Intelligence monitoring at the organization level. Misconfigured filters can result in buckets or locations being excluded from security monitoring, reducing visibility and compliance coverage across the entire organization. | None | None |
| `excluded_cloud_storage_buckets` |  | false | false | This is a nested block supporting the filter argument. Bucket exclusions are operational decisions and are not considered security-relevant without a defined organisational naming convention. | None | None |
| `included_cloud_storage_buckets` |  | false | false | This is a nested block supporting the filter argument. Bucket inclusions are operational decisions and are not considered security-relevant. | None | None |
| `excluded_cloud_storage_locations` |  | false | false | This is a nested block supporting the filter argument. Location exclusions are operational and cost management decisions, not security controls. | None | None |
| `included_cloud_storage_locations` |  | false | true | This nested block directly supports the data sovereignty policy. Storage Intelligence monitoring must only be applied to approved Australian regions to comply with IRAP and data residency requirements. | None | None |

### filter Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `excluded_cloud_storage_buckets` | Buckets to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_buckets). | false | false | Excluding specific buckets from Storage Intelligence monitoring is an operational scoping decision. Without a defined organisational bucket naming convention, this cannot be enforced as a blanket security policy. | None | None |
| `included_cloud_storage_buckets` | Buckets to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_buckets). | false | false | Including specific buckets is an operational scoping decision and does not directly impact security posture. | None | None |
| `excluded_cloud_storage_locations` | Locations to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_locations). | false | false | Excluding locations from Storage Intelligence is an operational and cost management decision. It does not directly enforce or weaken data security controls. | None | None |
| `included_cloud_storage_locations` | Locations to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_locations). | false | true | Restricting Storage Intelligence monitoring to approved regions enforces data sovereignty requirements at the organization level. Monitoring buckets outside approved regions may expose sensitive data patterns beyond organisational geographic boundaries, violating regulatory obligations such as IRAP. | None | None |

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
| `locations` | List of locations. | true | false | The list of excluded locations is an operational scoping value. No security policy is enforced at this level. | None | None |

### included_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | List of locations. | true | true | The locations list must only contain approved regions. Approved regions are australia-southeast1 and australia-southeast2. Any location outside these values violates data sovereignty requirements by extending monitoring coverage beyond approved geographic boundaries. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'europe-west1'] |
