## 🛡️ Policy Deployment Engine: `apigee_nat_address`

This section provides a concise policy evaluation for the `apigee_nat_address` resource in GCP.

Reference: [Terraform Registry – apigee_nat_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_nat_address)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Resource ID of the NAT address. | true | None | None |
| `instance_id` | The Apigee instance associated with the Apigee environment, in the format `organizations/{{org_name}}/instances/{{instance_name}}`. | true | None | None |
| `activate` | Flag that specifies whether the reserved NAT address should be activate. | false | None | None |
