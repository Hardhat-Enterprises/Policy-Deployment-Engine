## 🛡️ Policy Deployment Engine: `privileged_access_manager_entitlement`

This section provides a concise policy evaluation for the `privileged_access_manager_entitlement` resource in GCP.

Reference: [Terraform Registry – privileged_access_manager_entitlement](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privileged_access_manager_entitlement)

---

## 1. Argument Reference

### `eligible_users`
- Description: (Required) Who can create Grants using Entitlement. This list should contain at most one entry Structure is [documented below](#nested_eligible_users).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `privileged_access`
- Description: (Required) Privileged access that this service can be used to gate. Structure is [documented below](#nested_privileged_access).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_request_duration`
- Description: (Required) The maximum amount of time for which access would be granted for a request. A requester can choose to ask for access for less than this duration but never more. Format: calculate the time in seconds and concatenate it with 's' i.e. 2 hours = "7200s", 45 minutes = "2700s"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requester_justification_config`
- Description: (Required) Defines the ways in which a requester should provide the justification while requesting for access. Structure is [documented below](#nested_requester_justification_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The region of the Entitlement resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entitlement_id`
- Description: (Required) The ID to use for this Entitlement. This will become the last part of the resource name. This value should be 4-63 characters, and valid characters are "[a-z]", "[0-9]", and "-". The first character should be from [a-z]. This value should be unique among all other Entitlements under the specified `parent`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) Format: projects/{project-id|project-number} or organizations/{organization-number} or folders/{folder-number}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approval_workflow`
- Description: (Optional) The approvals needed before access will be granted to a requester. No approvals will be needed if this field is null. Different types of approval workflows that can be used to gate privileged access granting. Structure is [documented below](#nested_approval_workflow).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_notification_targets`
- Description: (Optional) AdditionalNotificationTargets includes email addresses to be notified. Structure is [documented below](#nested_additional_notification_targets). <a name="nested_eligible_users"></a>The `eligible_users` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principals`
- Description: (Required) Users who are being allowed for the operation. Each entry should be a valid v1 IAM Principal Identifier. Format for these is documented at "https://cloud.google.com/iam/docs/principal-identifiers#v1" <a name="nested_privileged_access"></a>The `privileged_access` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_iam_access`
- Description: (Required) GcpIamAccess represents IAM based access control on a GCP resource. Refer to https://cloud.google.com/iam/docs to understand more about IAM. Structure is [documented below](#nested_privileged_access_gcp_iam_access). <a name="nested_privileged_access_gcp_iam_access"></a>The `gcp_iam_access` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: (Required) The type of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource`
- Description: (Required) Name of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role_bindings`
- Description: (Required) Role bindings to be created on successful grant. Structure is [documented below](#nested_privileged_access_gcp_iam_access_role_bindings). <a name="nested_privileged_access_gcp_iam_access_role_bindings"></a>The `role_bindings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Required) IAM role to be granted. https://cloud.google.com/iam/docs/roles-overview.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition_expression`
- Description: (Optional) The expression field of the IAM condition to be associated with the role. If specified, a user with an active grant for this entitlement would be able to access the resource only if this condition evaluates to true for their request. https://cloud.google.com/iam/docs/conditions-overview#attributes. <a name="nested_requester_justification_config"></a>The `requester_justification_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `not_mandatory`
- Description: (Optional) The justification is not mandatory but can be provided in any of the supported formats.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unstructured`
- Description: (Optional) The requester has to provide a justification in the form of free flowing text. <a name="nested_approval_workflow"></a>The `approval_workflow` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_approvals`
- Description: (Required) A manual approval workflow where users who are designated as approvers need to call the ApproveGrant/DenyGrant APIs for an Grant. The workflow can consist of multiple serial steps where each step defines who can act as Approver in that step and how many of those users should approve before the workflow moves to the next step. This can be used to create approval workflows such as * Require an approval from any user in a group G. * Require an approval from any k number of users from a Group G. * Require an approval from any user in a group G and then from a user U. etc. A single user might be part of `approvers` ACL for multiple steps in this workflow but they can only approve once and that approval will only be considered to satisfy the approval step at which it was granted. Structure is [documented below](#nested_approval_workflow_manual_approvals). <a name="nested_approval_workflow_manual_approvals"></a>The `manual_approvals` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_approver_justification`
- Description: (Optional) Optional. Do the approvers need to provide a justification for their actions?
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `steps`
- Description: (Required) List of approval steps in this workflow. These steps would be followed in the specified order sequentially.  1 step is supported for now. Structure is [documented below](#nested_approval_workflow_manual_approvals_steps). <a name="nested_approval_workflow_manual_approvals_steps"></a>The `steps` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approvers`
- Description: (Required) The potential set of approvers in this step. This list should contain at only one entry. Structure is [documented below](#nested_approval_workflow_manual_approvals_steps_steps_approvers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approvals_needed`
- Description: (Optional) How many users from the above list need to approve. If there are not enough distinct users in the list above then the workflow will indefinitely block. Should always be greater than 0. Currently 1 is the only supported value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approver_email_recipients`
- Description: (Optional) Optional. Additional email addresses to be notified when a grant is pending approval. <a name="nested_approval_workflow_manual_approvals_steps_steps_approvers"></a>The `approvers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principals`
- Description: (Required) Users who are being allowed for the operation. Each entry should be a valid v1 IAM Principal Identifier. Format for these is documented at: https://cloud.google.com/iam/docs/principal-identifiers#v1 <a name="nested_additional_notification_targets"></a>The `additional_notification_targets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_email_recipients`
- Description: (Optional) Optional. Additional email addresses to be notified when a principal(requester) is granted access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requester_email_recipients`
- Description: (Optional) Optional. Additional email address to be notified about an eligible entitlement.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
