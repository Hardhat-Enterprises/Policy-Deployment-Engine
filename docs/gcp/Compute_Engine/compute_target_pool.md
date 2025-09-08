## 🛡️ Policy Deployment Engine: `compute_target_pool`

This section provides a concise policy evaluation for the `compute_target_pool` resource in GCP.

Reference: [Terraform Registry – compute_target_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | this forces a new resource to be created. - - - | none | None | None |
| `backup_pool` | failover_ratio. | none | None | None |
| `description` |  | none | None | None |
| `failover_ratio` | backup pool (which must also be set). | none | None | None |
| `health_checks` | legacy `google_compute_http_health_check` is supported. | none | None | None |
| `instances` | URLs, or in the form of "zone/name". Note that the instances need not exist at the time of target pool creation, so there is no need to use the Terraform interpolators to create a dependency on the instances from the target pool. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `region` | region. | none | None | None |
| `session_affinity` | affinity). "CLIENT_IP" (hash of the source/dest addresses / ports), and "CLIENT_IP_PROTO" also includes the protocol (default "NONE"). | none | None | None |
| `security_policy` |  | none | None | None |
