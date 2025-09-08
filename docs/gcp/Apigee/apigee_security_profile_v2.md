## 🛡️ Policy Deployment Engine: `apigee_security_profile_v2`

This section provides a concise policy evaluation for the `apigee_security_profile_v2` resource in GCP.

Reference: [Terraform Registry – apigee_security_profile_v2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_security_profile_v2)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` | The Apigee Organization associated with the Apigee Security Profile V2, in the format `organizations/{{org_name}}`. | true | None | None |
| `profile_id` | Resource ID of the security profile. | true | None | None |
| `description` | Description of the security profile. | false | None | None |

### profile_assessment_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `assessment` |  | none | None | None |
| `weight` | The weight of the assessment. Possible values are: `MINOR`, `MODERATE`, `MAJOR`. | true | None | None |
