## 🛡️ Policy Deployment Engine: `apigee_app_group`

This section provides a concise policy evaluation for the `apigee_app_group` resource in GCP.

Reference: [Terraform Registry – apigee_app_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_app_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the AppGroup. Characters you can use in the name are restricted to: A-Z0-9._-$ %. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee app group, in the format `organizations/{{org_name}}`. | true | None | None |
| `channel_uri` | A reference to the associated storefront/marketplace. | false | None | None |
| `channel_id` | Channel identifier identifies the owner maintaining this grouping. | false | None | None |
| `display_name` | App group name displayed in the UI | false | None | None |
| `status` | Valid values are active or inactive. Note that the status of the AppGroup should be updated via UpdateAppGroupRequest by setting the action as active or inactive. Possible values are: `active`, `inactive`. | false | None | None |

### attributes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Key of the attribute | false | None | None |
| `value` | Value of the attribute | false | None | None |
