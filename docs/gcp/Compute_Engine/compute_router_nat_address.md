## 🛡️ Policy Deployment Engine: `compute_router_nat_address`

This section provides a concise policy evaluation for the `compute_router_nat_address` resource in GCP.

Reference: [Terraform Registry – compute_router_nat_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat_address)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `nat_ips` | Self-links of NAT IPs to be used in a Nat service. Only valid if the referenced RouterNat natIpAllocateOption is set to MANUAL_ONLY. | true | None | None |
| `router` | The name of the Cloud Router in which the referenced NAT service is configured. | true | None | None |
| `router_nat` | The name of the Nat service in which this address will be configured. | true | None | None |
| `drain_nat_ips` | A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT. | false | None | None |
| `region` | Region where the NAT service reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
