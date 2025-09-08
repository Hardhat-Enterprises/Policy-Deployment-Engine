## 🛡️ Policy Deployment Engine: `apigee_sharedflow_deployment`

This section provides a concise policy evaluation for the `apigee_sharedflow_deployment` resource in GCP.

Reference: [Terraform Registry – apigee_sharedflow_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_sharedflow_deployment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` | The Apigee Organization associated with the Sharedflow | true | None | None |
| `environment` | The resource ID of the environment. | true | None | None |
| `sharedflow_id` | Id of the Sharedflow to be deployed. | true | None | None |
| `revision` | Revision of the Sharedflow to be deployed. - - - | true | None | None |
| `service_account` | The service account represents the identity of the deployed proxy, and determines what permissions it has. The format must be {ACCOUNT_ID}@{PROJECT}.iam.gserviceaccount.com. | false | None | None |
