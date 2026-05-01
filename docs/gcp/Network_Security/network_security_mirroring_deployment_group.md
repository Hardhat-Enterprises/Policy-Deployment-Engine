## 🛡️ Policy Deployment Engine: `network_security_mirroring_deployment_group`

This section provides a concise policy evaluation for the `network_security_mirroring_deployment_group` resource in GCP.

Reference: [Terraform Registry – network_security_mirroring_deployment_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_mirroring_deployment_group)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The network that will be used for all child deployments, for example: `projects/{project}/global/networks/{network}`. See https://google.aip.dev/124. | true | false | None | None | None |
| `location` | The cloud location of the deployment group, currently restricted to `global`. | true | false | None | None | None |
| `mirroring_deployment_group_id` | The ID to use for the new deployment group, which will become the final component of the deployment group's resource name. | true | false | None | None | None |
| `labels` | Labels are key/value pairs that help to organize and filter resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `description` | User-provided description of the deployment group. Used as additional context for the deployment group. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
