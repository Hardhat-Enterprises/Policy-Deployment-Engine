## 🛡️ Policy Deployment Engine: `app_engine_service_network_settings`

This section provides a concise policy evaluation for the `app_engine_service_network_settings` resource in GCP.

Reference: [Terraform Registry – app_engine_service_network_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_network_settings)

---

## 1. Argument Reference

### `service`
- Description: (Required) The name of the service these settings apply to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_settings`
- Description: (Required) Ingress settings for this service. Will apply to all versions. Structure is [documented below](#nested_network_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network_settings"></a>The `network_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_traffic_allowed`
- Description: (Optional) The ingress settings for version or service. Default value is `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`. Possible values are: `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`, `INGRESS_TRAFFIC_ALLOWED_ALL`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
