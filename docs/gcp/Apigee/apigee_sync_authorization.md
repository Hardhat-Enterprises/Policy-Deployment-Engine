## 🛡️ Policy Deployment Engine: `apigee_sync_authorization`

This section provides a concise policy evaluation for the `apigee_sync_authorization` resource in GCP.

Reference: [Terraform Registry – apigee_sync_authorization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_sync_authorization)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `identities` | Array of service accounts to grant access to control plane resources, each specified using the following format: `serviceAccount:service-account-name`. The `service-account-name` is formatted like an email address. For example: my-synchronizer-manager-serviceAccount@my_project_id.iam.gserviceaccount.com You might specify multiple service accounts, for example, if you have multiple environments and wish to assign a unique service account to each one. The service accounts must have **Apigee Synchronizer Manager** role. See also [Create service accounts](https://cloud.google.com/apigee/docs/hybrid/v1.8/sa-about#create-the-service-accounts). | true | None | None |
| `name` | Name of the Apigee organization. | true | None | None |
