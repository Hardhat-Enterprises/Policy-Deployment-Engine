## 🛡️ Policy Deployment Engine: `service_networking_vpc_service_controls`

This section provides a concise policy evaluation for the `service_networking_vpc_service_controls` resource in GCP.

Reference: [Terraform Registry – service_networking_vpc_service_controls](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_vpc_service_controls)

---

## 1. Argument Reference

### `enabled`
- Description: (Required) Desired VPC Service Controls state service producer VPC network, as described at the top of this page.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The network that the consumer is using to connect with services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) The service that is managing peering connectivity for a service producer's organization. For Google services that support this functionality, this value is `servicenetworking.googleapis.com`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The id of the Google Cloud project containing the consumer network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
