## 🛡️ Policy Deployment Engine: `apigee_organization`

This section provides a concise policy evaluation for the `apigee_organization` resource in GCP.

Reference: [Terraform Registry – apigee_organization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_organization)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The project ID associated with the Apigee organization. | true | false | It sets the project association and does not have any direct security impact. | None | None |
| `display_name` | The display name of the Apigee organization. | false | false | display_name is a human-readable label used for identification purposes only in the GCP console. It does not affect access control, encryption, network configuration, or any security mechanism within the Apigee platform. | None | None |
| `description` | Description of the Apigee organization. | false | false | description is a free-text documentation field only. It does not affect any security controls, access permissions, encryption, or network configurations within the Apigee platform. | None | None |
| `analytics_region` | Primary GCP region for analytics data storage. | false | true | Storing analytics data in unapproved regions may violate data residency and compliance requirements. Only approved regions should be used. | australia-southeast1 | us-central1 |
| `api_consumer_data_location` | This field is needed only for customers using non-default data residency regions. Apigee stores some control plane data only in single region. | false | true | Storing API consumer data in non-approved regions may violate data sovereignty and compliance requirements such as the Australian Privacy Act. Data residency must be explicitly controlled to prevent unauthorized cross-border data transfers and regulatory violations. | None | None |
| `api_consumer_data_encryption_key_name` | Cloud KMS key name used for encrypting API consumer data. | false | true | Without a Customer Managed Encryption Key (CMEK), API consumer data is encrypted using Google-managed keys which may not satisfy compliance requirements. CMEK ensures full control over encryption keys. | projects/pde-proj/locations/australia-southeast1/keyRings/pde-keyring/cryptoKeys/pde-key | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key |
| `control_plane_encryption_key_name` | Cloud KMS key name used for encrypting control plane data that is stored in a multi region. Only used for the data residency region US or EU. | false | true | Without a Customer Managed Encryption Key (CMEK), control plane data is encrypted using Google-managed keys which may not satisfy compliance requirements. CMEK ensures full control over encryption keys for multi-region data. | projects/pde-proj/locations/australia-southeast1/keyRings/pde-keyring/cryptoKeys/pde-key | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key |
| `authorized_network` | Compute Engine network used for Service Networking to be peered with Apigee runtime instances. | false | true | An overly permissive or misconfigured authorized_network can expose Apigee runtime instances to unauthorized network access. Restricting the authorized network ensures only trusted VPC networks can peer with Apigee, preventing lateral movement and unauthorized traffic. | None | None |
| `disable_vpc_peering` | Flag that specifies whether the VPC Peering through Private Google Access should be disabled between the consumer network and Apigee. | false | true | Disabling VPC peering removes the private network path between the consumer project and Apigee runtime instances, forcing API traffic over the public internet and significantly increasing exposure to interception, man-in-the-middle attacks, and unauthorized access. | None | None |
| `runtime_type` | Runtime type of the Apigee organization based on the Apigee subscription purchased. Possible values are: CLOUD, HYBRID. | false | false | runtime_type defines the infrastructure model for the Apigee organization. HYBRID is not inherently insecure as many organizations prefer hybrid infrastructure. It does not directly control access permissions, encryption, or data exposure. | None | None |
| `billing_type` | Billing type of the Apigee organization. | false | false | billing_type determines the pricing model for the Apigee organization only. It does not control access permissions, encryption keys, network exposure, or any other security mechanism within the Apigee platform. | None | None |
| `runtime_database_encryption_key_name` | Cloud KMS key name used for encrypting the data that is stored and replicated across runtime instances. Update is not allowed after the organization is created. | false | true | Without a Customer Managed Encryption Key (CMEK), runtime database data is encrypted using Google-managed keys which may not satisfy compliance requirements. CMEK ensures full control over encryption of data replicated across runtime instances. | projects/pde-proj/locations/australia-southeast1/keyRings/pde-keyring/cryptoKeys/pde-key | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key |
| `retention` | Controls how long Organization data will be retained after the initial delete operation completes. Possible values are: DELETION_RETENTION_UNSPECIFIED, MINIMUM. | false | true | Setting retention to DELETION_RETENTION_UNSPECIFIED does not guarantee minimum data retention after deletion, preventing recovery of accidentally deleted organizations. MINIMUM ensures data is retained for the minimum period. | MINIMUM | DELETION_RETENTION_UNSPECIFIED |
| `properties` | Properties defined in the Apigee organization profile. | false | false | It sets custom key-value properties and does not have any direct security impact. | Refer to child argument | Refer to child argument |

### properties Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `property` | List of all properties in the object. | false | false | Properties are custom key-value metadata fields used for organizational configuration only. They do not control access permissions, encryption keys, network exposure, or any other security mechanism within the Apigee platform. | Refer to child argument | Refer to child argument |

###   property Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `name` | Name of the property. | false | false | It sets the property key name and does not have any security impact. | None | None |
  | `value` | Value of the property. | false | false | It sets the property value and does not have any security impact. | None | None |
