## 🛡️ Policy Deployment Engine: `apigee_organization`

This section provides a concise policy evaluation for the `apigee_organization` resource in GCP.

Reference: [Terraform Registry – apigee_organization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_organization)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The project ID associated with the Apigee organization. | true | false | It sets the project association and does not have any direct security impact. | None | None |
| `display_name` | The display name of the Apigee organization. | false | false | It sets the display name only and does not have any security impact. | None | None |
| `description` | Description of the Apigee organization. | false | false | It sets the description only and does not have any security impact. | None | None |
| `analytics_region` | Primary GCP region for analytics data storage. | false | true | Storing analytics data in unapproved regions may violate data residency and compliance requirements. Only approved regions should be used. | us-central1 | us-east1 |
| `api_consumer_data_location` | This field is needed only for customers using non-default data residency regions. Apigee stores some control plane data only in single region. | false | false | It sets the data residency location and does not have any direct security impact. | None | None |
| `api_consumer_data_encryption_key_name` | Cloud KMS key name used for encrypting API consumer data. | false | true | Without a Customer Managed Encryption Key (CMEK), API consumer data is encrypted using Google-managed keys which may not satisfy compliance requirements. CMEK ensures full control over encryption keys. | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key | None |
| `control_plane_encryption_key_name` | Cloud KMS key name used for encrypting control plane data that is stored in a multi region. Only used for the data residency region US or EU. | false | true | Without a Customer Managed Encryption Key (CMEK), control plane data is encrypted using Google-managed keys which may not satisfy compliance requirements. CMEK ensures full control over encryption keys for multi-region data. | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key | None |
| `authorized_network` | Compute Engine network used for Service Networking to be peered with Apigee runtime instances. | false | false | It sets the network peering configuration and does not have any direct security impact. | None | None |
| `disable_vpc_peering` | Flag that specifies whether the VPC Peering through Private Google Access should be disabled between the consumer network and Apigee. | false | false | It sets the VPC peering configuration and does not have any direct security impact. | None | None |
| `runtime_type` | Runtime type of the Apigee organization based on the Apigee subscription purchased. Possible values are: CLOUD, HYBRID. | false | true | Setting runtime_type to HYBRID runs Apigee on customer-managed infrastructure which increases operational complexity and security risk. CLOUD uses Google-managed infrastructure with built-in security controls. | CLOUD | HYBRID |
| `billing_type` | Billing type of the Apigee organization. | false | false | It sets the billing type only and does not have any security impact. | None | None |
| `runtime_database_encryption_key_name` | Cloud KMS key name used for encrypting the data that is stored and replicated across runtime instances. Update is not allowed after the organization is created. | false | true | Without a Customer Managed Encryption Key (CMEK), runtime database data is encrypted using Google-managed keys which may not satisfy compliance requirements. CMEK ensures full control over encryption of data replicated across runtime instances. | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key | None |
| `retention` | Controls how long Organization data will be retained after the initial delete operation completes. Possible values are: DELETION_RETENTION_UNSPECIFIED, MINIMUM. | false | true | Setting retention to DELETION_RETENTION_UNSPECIFIED does not guarantee minimum data retention after deletion, preventing recovery of accidentally deleted organizations. MINIMUM ensures data is retained for the minimum period. | MINIMUM | DELETION_RETENTION_UNSPECIFIED |
| `properties` | Properties defined in the Apigee organization profile. | false | false | It sets custom key-value properties and does not have any direct security impact. | Refer to child argument | Refer to child argument |

### properties Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `property` | List of all properties in the object. | false | false | It sets custom properties and does not have any security impact. | Refer to child argument | Refer to child argument |

###   property Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `name` | Name of the property. | false | false | It sets the property key name and does not have any security impact. | None | None |
  | `value` | Value of the property. | false | false | It sets the property value and does not have any security impact. | None | None |
