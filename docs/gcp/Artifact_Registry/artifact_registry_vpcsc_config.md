## 🛡️ Policy Deployment Engine: `artifact_registry_vpcsc_config`

This section provides a concise policy evaluation for the `artifact_registry_vpcsc_config` resource in GCP.

Reference: [Terraform Registry – artifact_registry_vpcsc_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_vpcsc_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vpcsc_policy` | The VPC SC policy for project and location. Possible values are: `DENY`, `ALLOW`. | false | None | None |
| `location` | The name of the location this config is located in. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
