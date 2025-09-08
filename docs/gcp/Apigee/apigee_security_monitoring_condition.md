## 🛡️ Policy Deployment Engine: `apigee_security_monitoring_condition`

This section provides a concise policy evaluation for the `apigee_security_monitoring_condition` resource in GCP.

Reference: [Terraform Registry – apigee_security_monitoring_condition](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_security_monitoring_condition)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `profile` | ID of security profile of the security monitoring condition. | true | None | None |
| `scope` | ID of security profile of the security monitoring condition. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee Security Monitoring Condition, in the format `organizations/{{org_name}}`. | true | None | None |
| `condition_id` | Resource ID of the security monitoring condition. | true | None | None |
| `include_all_resources` | A nested object resource. | false | None | None |
