## 🛡️ Policy Deployment Engine: `app_engine_service_network_settings`

This section provides a concise policy evaluation for the `app_engine_service_network_settings` resource in GCP.

Reference: [Terraform Registry – app_engine_service_network_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_network_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | The name of the service these settings apply to. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ingress_traffic_allowed` | The ingress settings for version or service. Default value is `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`. Possible values are: `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`, `INGRESS_TRAFFIC_ALLOWED_ALL`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB`. | false | None | None |
