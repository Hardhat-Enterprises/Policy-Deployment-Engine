## 🛡️ Policy Deployment Engine: `apigee_developer`

This section provides a concise policy evaluation for the `apigee_developer` resource in GCP.

Reference: [Terraform Registry – apigee_developer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_developer)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | Email address of the developer. This value is used to uniquely identify the developer in Apigee hybrid. Note that the email address has to be in lowercase only.. | true | None | None |
| `first_name` | First name of the developer. | true | None | None |
| `last_name` | Last name of the developer. | true | None | None |
| `user_name` | User name of the developer. Not used by Apigee hybrid. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`. | true | None | None |

### attributes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Key of the attribute | false | None | None |
| `value` | Value of the attribute | false | None | None |
