## 🛡️ Policy Deployment Engine: `artifact_registry_vpcsc_config`

This section provides a concise policy evaluation for the `artifact_registry_vpcsc_config` resource in GCP.

Reference: [Terraform Registry – artifact_registry_vpcsc_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_vpcsc_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpcsc_policy` | The VPC SC policy for project and location. Possible values are: `DENY`, `ALLOW`. | false | false | Your vpcsc_policy policy requires the value DENY. | ['vpcsc_policy = "DENY"'] | ['vpcsc_policy = "ALLOW"'] |
| `location` | The name of the location this config is located in. | false | false | Your VPC SC location policy whitelists only australia-southeast1-a/b/c and australia-southeast2-a/b/c. | ['location = "australia-southeast1-a"', 'location = "australia-southeast2-c"'] | ['location = "us-central1"', 'location = "europe-west1"'] |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
