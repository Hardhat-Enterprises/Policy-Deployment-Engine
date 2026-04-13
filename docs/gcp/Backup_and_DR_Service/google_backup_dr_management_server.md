## 🛡️ Policy Deployment Engine: `google_backup_dr_management_server`

This section provides a concise policy evaluation for the `google_backup_dr_management_server` resource in GCP.

Reference: [Terraform Registry – google_backup_dr_management_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_backup_dr_management_server)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location determines physical hosting region and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `name` | Required. The name of management server (management console) | true | false | Name has no impact on the security of the resource or data contained. | None | None |
| `type` |  The type of management server (management console). | false | false | Type has no impact on the security of the resource or data contained. | None | None |
| `networks` | The correct VPC networks to which the resource is attached. | false | true | Restricting operations to approved networks reduces exposure and prevents unintended access | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | even without manual ID configuration ID will be automatically generated. | None | None |

### networks Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | Required. Network with format `projects/{{project_id}}/global/networks/{{network_id}}` | true | true | The selected VPC network defines the security boundary and connectivity scope for the resource. | None | None |
| `peering_mode` | Type of Network peeringMode Default value is `PRIVATE_SERVICE_ACCESS`. | false | true | Peering mode determines how the network connects to other services and affects security posture. | None | None |
