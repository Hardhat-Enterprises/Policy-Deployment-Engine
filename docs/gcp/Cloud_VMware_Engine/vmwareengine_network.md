## 🛡️ Policy Deployment Engine: `vmwareengine_network`

This section provides a concise policy evaluation for the `vmwareengine_network` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | VMware Engine network type. Possible values are: `LEGACY`, `STANDARD`. | true | None | None |
| `location` | The location where the VMwareEngineNetwork should reside. | true | None | None |
| `name` | The ID of the VMwareEngineNetwork. | true | None | None |
| `description` | User-provided description for this VMware Engine network. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
