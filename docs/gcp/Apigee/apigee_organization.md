## 🛡️ Policy Deployment Engine: `apigee_organization`

This section provides a concise policy evaluation for the `apigee_organization` resource in GCP.

Reference: [Terraform Registry – apigee_organization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_organization)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The project ID associated with the Apigee organization. | true | None | None |
| `display_name` | The display name of the Apigee organization. | false | None | None |
| `description` | Description of the Apigee organization. | false | None | None |
| `analytics_region` | Primary GCP region for analytics data storage. For valid values, see [Create an Apigee organization](https://cloud.google.com/apigee/docs/api-platform/get-started/create-org). | false | None | None |
| `api_consumer_data_location` | This field is needed only for customers using non-default data residency regions. Apigee stores some control plane data only in single region. This field determines which single region Apigee should use. | false | None | None |
| `api_consumer_data_encryption_key_name` | Cloud KMS key name used for encrypting API consumer data. | false | None | None |
| `control_plane_encryption_key_name` | Cloud KMS key name used for encrypting control plane data that is stored in a multi region. Only used for the data residency region "US" or "EU". | false | None | None |
| `authorized_network` | Compute Engine network used for Service Networking to be peered with Apigee runtime instances. See [Getting started with the Service Networking API](https://cloud.google.com/service-infrastructure/docs/service-networking/getting-started). Valid only when `RuntimeType` is set to CLOUD. The value can be updated only when there are no runtime instances. For example: "default". | false | None | None |
| `disable_vpc_peering` | Flag that specifies whether the VPC Peering through Private Google Access should be disabled between the consumer network and Apigee. Required if an `authorizedNetwork` on the consumer project is not provided, in which case the flag should be set to `true`. Valid only when `RuntimeType` is set to CLOUD. The value must be set before the creation of any Apigee runtime instance and can be updated only when there are no runtime instances. | false | None | None |
| `runtime_type` | Runtime type of the Apigee organization based on the Apigee subscription purchased. Default value is `CLOUD`. Possible values are: `CLOUD`, `HYBRID`. | false | None | None |
| `billing_type` | Billing type of the Apigee organization. See [Apigee pricing](https://cloud.google.com/apigee/pricing). | false | None | None |
| `runtime_database_encryption_key_name` | Cloud KMS key name used for encrypting the data that is stored and replicated across runtime instances. Update is not allowed after the organization is created. If not specified, a Google-Managed encryption key will be used. Valid only when `RuntimeType` is CLOUD. For example: `projects/foo/locations/us/keyRings/bar/cryptoKeys/baz`. | false | None | None |
| `retention` | Optional. This setting is applicable only for organizations that are soft-deleted (i.e., BillingType is not EVALUATION). It controls how long Organization data will be retained after the initial delete operation completes. During this period, the Organization may be restored to its last known state. After this period, the Organization will no longer be able to be restored. Default value is `DELETION_RETENTION_UNSPECIFIED`. Possible values are: `DELETION_RETENTION_UNSPECIFIED`, `MINIMUM`. | false | None | None |

### properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `property` | List of all properties in the object. Structure is [documented below](#nested_properties_property). | false | None | None |

### property Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the property. | false | None | None |
| `value` | Value of the property. | false | None | None |
