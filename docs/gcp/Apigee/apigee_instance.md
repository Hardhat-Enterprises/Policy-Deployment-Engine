## 🛡️ Policy Deployment Engine: `apigee_instance`

This section provides a concise policy evaluation for the `apigee_instance` resource in GCP.

Reference: [Terraform Registry – apigee_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Resource ID of the Apigee instance. | true | false | Sets the name of the instance and does not have any security impact. | None | None |
| `location` | Required. Compute Engine location where the instance resides. | true | true | The location determines data residency and regulatory compliance. Deploying in unapproved regions may violate data sovereignty requirements. | us-central1 | us-east1 |
| `org_id` | The Apigee Organization associated with the Apigee instance, in the format organizations/{{org_name}}. | true | false | Sets the organization ID of the instance and does not have any direct security impact. | None | None |
| `disk_encryption_key_name` | Customer Managed Encryption Key (CMEK) used for disk and volume encryption. Required for Apigee paid subscriptions only. Use the following format: projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+). | false | true | CMEK ensures that data at rest is encrypted using customer-managed keys, maintaining control over encryption and meeting compliance requirements. Without CMEK, default Google-managed keys are used which may not satisfy compliance requirements. | projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key | None |
| `ip_range` | IP range represents the customer-provided CIDR block of length 22 that will be used for the Apigee instance creation. Input format: a.b.c.d/22. | false | true | An incorrect CIDR block size can cause network misconfiguration, overlapping ranges, or insufficient IP space for the instance. Only /22 blocks are supported. | 10.87.8.0/22 | 10.87.8.0/16 |
| `peering_cidr_range` | The size of the CIDR block range that will be reserved by the instance. For valid values, see CidrRange on the documentation. | false | true | Incorrect CIDR range size can lead to IP exhaustion or network conflicts within the VPC peering connection. | SLASH_22 | None |
| `description` | Description of the Apigee instance. | false | false | A descriptive field only, does not have any security impact. | None | None |
| `display_name` | Display name of the Apigee instance. | false | false | A display name field only, does not have any security impact. | None | None |
| `consumer_accept_list` | Optional. Customer accept list represents the list of projects (id/number) on customer side that can privately connect to the service attachment. | false | true | Restricting which projects can privately connect to the service attachment limits the attack surface and prevents unauthorized access to the Apigee instance. | ['my-project-id'] | None |
| `access_logging_config` | Access logging configuration enables the access logging feature at the instance. Apigee customers can enable access logging to ship the access logs to their own project's cloud logging. | false | true | Enabling access logging is critical for security monitoring, audit trails, and incident response. Without access logs, unauthorized access or anomalous activity cannot be detected. | Refer to child argument | Refer to child argument |

### access_logging_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Boolean flag that specifies whether the customer access log feature is enabled. | true | true | Access logging must be enabled to maintain an audit trail of all API traffic through the Apigee instance. Disabled logging prevents detection of unauthorized access or anomalous activity. | True | False |
| `filter` | Ship the access log entries that match the statusCode defined in the filter. Example: statusCode >= 200 && statusCode < 300. | false | false | Filter is optional and used to limit which log entries are shipped. Does not directly impact security posture. | None | None |
