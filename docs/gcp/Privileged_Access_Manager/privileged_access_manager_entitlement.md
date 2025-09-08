## 🛡️ Policy Deployment Engine: `privileged_access_manager_entitlement`

This section provides a concise policy evaluation for the `privileged_access_manager_entitlement` resource in GCP.

Reference: [Terraform Registry – privileged_access_manager_entitlement](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privileged_access_manager_entitlement)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_request_duration` | The maximum amount of time for which access would be granted for a request. A requester can choose to ask for access for less than this duration but never more. Format: calculate the time in seconds and concatenate it with 's' i.e. 2 hours = "7200s", 45 minutes = "2700s" | true | None | None |
| `location` | The region of the Entitlement resource. | true | None | None |
| `entitlement_id` | The ID to use for this Entitlement. This will become the last part of the resource name. This value should be 4-63 characters, and valid characters are "[a-z]", "[0-9]", and "-". The first character should be from [a-z]. This value should be unique among all other Entitlements under the specified `parent`. | true | None | None |
| `parent` | Format: projects/{project-id|project-number} or organizations/{organization-number} or folders/{folder-number} | true | None | None |

### eligible_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `principals` | Users who are being allowed for the operation. Each entry should be a valid v1 IAM Principal Identifier. Format for these is documented at "https://cloud.google.com/iam/docs/principal-identifiers#v1" | true | None | None |

### privileged_access Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gcp_iam_access` | GcpIamAccess represents IAM based access control on a GCP resource. Refer to https://cloud.google.com/iam/docs to understand more about IAM. Structure is [documented below](#nested_privileged_access_gcp_iam_access). | true | None | None |

### requester_justification_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `not_mandatory` | The justification is not mandatory but can be provided in any of the supported formats. | false | None | None |
| `unstructured` | The requester has to provide a justification in the form of free flowing text. | false | None | None |

### approval_workflow Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `manual_approvals` | A manual approval workflow where users who are designated as approvers need to call the ApproveGrant/DenyGrant APIs for an Grant. The workflow can consist of multiple serial steps where each step defines who can act as Approver in that step and how many of those users should approve before the workflow moves to the next step. This can be used to create approval workflows such as * Require an approval from any user in a group G. * Require an approval from any k number of users from a Group G. * Require an approval from any user in a group G and then from a user U. etc. A single user might be part of `approvers` ACL for multiple steps in this workflow but they can only approve once and that approval will only be considered to satisfy the approval step at which it was granted. Structure is [documented below](#nested_approval_workflow_manual_approvals). | true | None | None |

### additional_notification_targets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_email_recipients` | Optional. Additional email addresses to be notified when a principal(requester) is granted access. | false | None | None |
| `requester_email_recipients` | Optional. Additional email address to be notified about an eligible entitlement. | false | None | None |

### gcp_iam_access Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_type` | The type of this resource. | true | None | None |
| `resource` | Name of the resource. | true | None | None |
| `role_bindings` | Role bindings to be created on successful grant. Structure is [documented below](#nested_privileged_access_gcp_iam_access_role_bindings). | true | None | None |

### role_bindings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `role` | IAM role to be granted. https://cloud.google.com/iam/docs/roles-overview. | true | None | None |
| `condition_expression` | The expression field of the IAM condition to be associated with the role. If specified, a user with an active grant for this entitlement would be able to access the resource only if this condition evaluates to true for their request. https://cloud.google.com/iam/docs/conditions-overview#attributes. | false | None | None |

### manual_approvals Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `require_approver_justification` | Optional. Do the approvers need to provide a justification for their actions? | false | None | None |
| `steps` | List of approval steps in this workflow. These steps would be followed in the specified order sequentially.  1 step is supported for now. Structure is [documented below](#nested_approval_workflow_manual_approvals_steps). | true | None | None |

### steps Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `approvers` | The potential set of approvers in this step. This list should contain at only one entry. Structure is [documented below](#nested_approval_workflow_manual_approvals_steps_steps_approvers). | true | None | None |
| `approvals_needed` | How many users from the above list need to approve. If there are not enough distinct users in the list above then the workflow will indefinitely block. Should always be greater than 0. Currently 1 is the only supported value. | false | None | None |
| `approver_email_recipients` | Optional. Additional email addresses to be notified when a grant is pending approval. | false | None | None |

### approvers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `principals` | Users who are being allowed for the operation. Each entry should be a valid v1 IAM Principal Identifier. Format for these is documented at: https://cloud.google.com/iam/docs/principal-identifiers#v1 | true | None | None |
