## 🛡️ Policy Deployment Engine: `service_usage_consumer_quota_override`

This section provides a concise policy evaluation for the `service_usage_consumer_quota_override` resource in GCP.

Reference: [Terraform Registry – service_usage_consumer_quota_override](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_usage_consumer_quota_override)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `override_value` | The overriding quota limit value. Can be any nonnegative integer, or -1 (unlimited quota). | true | None | None |
| `service` | The service that the metrics belong to, e.g. `compute.googleapis.com`. | true | None | None |
| `metric` | The metric that should be limited, e.g. `compute.googleapis.com/cpus`. | true | None | None |
| `limit` | The limit on the metric, e.g. `/project/region`. ~> Make sure that `limit` is in a format that doesn't start with `1/` or contain curly braces. E.g. use `/project/user` instead of `1/{project}/{user}`. | true | None | None |
| `dimensions` | If this map is nonempty, then this override applies only to specific values for dimensions defined in the limit unit. | false | None | None |
| `force` | If the new quota would decrease the existing quota by more than 10%, the request is rejected. If `force` is `true`, that safety check is ignored. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
