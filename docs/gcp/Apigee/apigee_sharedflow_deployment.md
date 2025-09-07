## 🛡️ Policy Deployment Engine: `apigee_sharedflow_deployment`

This section provides a concise policy evaluation for the `apigee_sharedflow_deployment` resource in GCP.

Reference: [Terraform Registry – apigee_sharedflow_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_sharedflow_deployment)

---

## 1. Argument Reference

### `org_id`
- Description: (Required) The Apigee Organization associated with the Sharedflow
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Required) The resource ID of the environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sharedflow_id`
- Description: (Required) Id of the Sharedflow to be deployed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `revision`
- Description: (Required) Revision of the Sharedflow to be deployed. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The service account represents the identity of the deployed proxy, and determines what permissions it has. The format must be {ACCOUNT_ID}@{PROJECT}.iam.gserviceaccount.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
