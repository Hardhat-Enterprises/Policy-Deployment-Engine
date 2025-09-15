## 🛡️ Policy Deployment Engine: `app_engine_service_network_settings`

This section provides a concise policy evaluation for the `app_engine_service_network_settings` resource in GCP.

Reference: [Terraform Registry – app_engine_service_network_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_network_settings)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The name of the service these settings apply to. | true | false | Ensures ingress rules are properly applied to sensitive services. | service = "payments-service" with network restrictions applied. | service = "default" without proper isolation. |
| `network_settings` | Ingress settings for this service. Will apply to all versions. | true | false | Restrict ingress traffic to internal or load-balanced requests to minimize exposure. | ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY" | ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_ALL" for sensitive workloads. |
| `project` | If it is not provided, the provider project is used. | false | false | Explicitly define the project to avoid accidental inheritance or misapplication of rules. | project = "secure-project" | Relying on implicit provider project without validation. |

### network_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingress_traffic_allowed` | The ingress settings for version or service. Default value is `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`. Possible values are: `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`, `INGRESS_TRAFFIC_ALLOWED_ALL`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB`. | false | false | Ingress should be restricted to internal or load balancer traffic for production systems. | INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY or INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB. | INGRESS_TRAFFIC_ALLOWED_ALL for sensitive applications. |
