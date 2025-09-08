## 🛡️ Policy Deployment Engine: `network_security_mirroring_deployment`

This section provides a concise policy evaluation for the `network_security_mirroring_deployment` resource in GCP.

Reference: [Terraform Registry – network_security_mirroring_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_mirroring_deployment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `forwarding_rule` | The regional forwarding rule that fronts the mirroring collectors, for example: `projects/123456789/regions/us-central1/forwardingRules/my-rule`. See https://google.aip.dev/124. | true | None | None |
| `mirroring_deployment_group` | The deployment group that this deployment is a part of, for example: `projects/123456789/locations/global/mirroringDeploymentGroups/my-dg`. See https://google.aip.dev/124. | true | None | None |
| `location` | The cloud location of the deployment, e.g. `us-central1-a` or `asia-south1-b`. | true | None | None |
| `mirroring_deployment_id` | The ID to use for the new deployment, which will become the final component of the deployment's resource name. | true | None | None |
| `labels` | Labels are key/value pairs that help to organize and filter resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | User-provided description of the deployment. Used as additional context for the deployment. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
