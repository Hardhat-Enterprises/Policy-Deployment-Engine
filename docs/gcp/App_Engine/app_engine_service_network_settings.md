## 🛡️ Policy Deployment Engine: `app_engine_service_network_settings`

This section provides a concise policy evaluation for the `app_engine_service_network_settings` resource in GCP.

Reference: [Terraform Registry – app_engine_service_network_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_network_settings)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The name of the service these settings apply to. | true | true | Enforced to establish a verifiable network perimeter at the application layer. | app-internal-service | internal-service |
| `network_settings` | Ingress settings for this service. Will apply to all versions. Structure is [documented below](#nested_network_settings). | true | true | Enforced to ensure the definition of the fundamental trust boundary of the application | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | To automatically inherit the provider-level project ID. | None | None |

### network_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingress_traffic_allowed` | The ingress settings for version or service. Default value is `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`. Possible values are: `INGRESS_TRAFFIC_ALLOWED_UNSPECIFIED`, `INGRESS_TRAFFIC_ALLOWED_ALL`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY`, `INGRESS_TRAFFIC_ALLOWED_INTERNAL_AND_LB`. | false | true | Is enforced to mitigate the risk of direct-to-origin attacks from occurring. By ensuring that the default unshielded App Engine URL is disabled. | INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY | INGRESS_TRAFFIC_ALLOWED_ALL |
