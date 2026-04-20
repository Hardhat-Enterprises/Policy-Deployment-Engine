## 🛡️ Policy Deployment Engine: `artifact_registry_vpcsc_config`

This section provides a concise policy evaluation for the `artifact_registry_vpcsc_config` resource in GCP.

Reference: [Terraform Registry – artifact_registry_vpcsc_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_vpcsc_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpcsc_policy` | The VPC SC policy for project and location. Possible values are: `DENY`, `ALLOW`. | false | true | Your vpcsc_policy policy requires the value DENY. | DENY | ALLOW |
| `location` | The name of the location this config is located in. | false | true | Your VPC SC location policy whitelists only australia-southeast1-a/b/c and australia-southeast2-a/b/c. | australia-southeast1-a | us-central1 |
| `project` | If it is not provided, the provider project is used. | true | false | None | None | None |
