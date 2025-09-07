## 🛡️ Policy Deployment Engine: `apigee_control_plane_access`

This section provides a concise policy evaluation for the `apigee_control_plane_access` resource in GCP.

Reference: [Terraform Registry – apigee_control_plane_access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_control_plane_access)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the Apigee organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `synchronizer_identities`
- Description: (Optional) Array of service accounts to grant access to control plane resources (for the Synchronizer component), each specified using the following format: `serviceAccount:service-account-name`. The `service-account-name` is formatted like an email address. For example: serviceAccount@my_project_id.iam.gserviceaccount.com You might specify multiple service accounts, for example, if you have multiple environments and wish to assign a unique service account to each one. The service accounts must have **Apigee Synchronizer Manager** role. See also [Create service accounts](https://cloud.google.com/apigee/docs/hybrid/v1.8/sa-about#create-the-service-accounts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `analytics_publisher_identities`
- Description: (Optional) Array of service accounts authorized to publish analytics data to the control plane, each specified using the following format: `serviceAccount:service-account-name`. The `service-account-name` is formatted like an email address. For example: serviceAccount@my_project_id.iam.gserviceaccount.com You might specify multiple service accounts, for example, if you have multiple environments and wish to assign a unique service account to each one.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
