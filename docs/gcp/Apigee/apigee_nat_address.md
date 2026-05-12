## 🛡️ Policy Deployment Engine: `apigee_nat_address`

This section provides a concise policy evaluation for the `apigee_nat_address` resource in GCP.

Reference: [Terraform Registry – apigee_nat_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_nat_address)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource ID of the NAT address. | true | false | It sets the identifier of the NAT address and does not have any direct security impact. | None | None |
| `instance_id` | The Apigee instance associated with the NAT address. | true | false | It sets the instance association and does not have any direct security impact. | None | None |
| `activate` | Flag that specifies whether the NAT address is activated so that the reserved address can be used for Internet egress traffic. | false | true | An inactive NAT address means the reserved static IP is not in use for Internet egress traffic, wasting reserved IP resources and removing egress traffic control. | True | False |
