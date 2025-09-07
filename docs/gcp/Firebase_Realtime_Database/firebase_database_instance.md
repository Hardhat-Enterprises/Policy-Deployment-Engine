## 🛡️ Policy Deployment Engine: `firebase_database_instance`

This section provides a concise policy evaluation for the `firebase_database_instance` resource in GCP.

Reference: [Terraform Registry – firebase_database_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_database_instance)

---

## 1. Argument Reference

### `region`
- Description: (Required) A reference to the region where the Firebase Realtime database resides. Check all [available regions](https://firebase.google.com/docs/projects/locations#rtdb-locations)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) The globally unique identifier of the Firebase Realtime Database instance. Instance IDs cannot be reused after deletion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The database type. Each project can create one default Firebase Realtime Database, which cannot be deleted once created. Creating user Databases is only available for projects on the Blaze plan. Projects can be upgraded using the Cloud Billing API https://cloud.google.com/billing/reference/rest/v1/projects/updateBillingInfo. Default value is `USER_DATABASE`. Possible values are: `DEFAULT_DATABASE`, `USER_DATABASE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
