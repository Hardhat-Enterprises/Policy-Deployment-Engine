## 🛡️ Policy Deployment Engine: `vmwareengine_external_address`

This section provides a concise policy evaluation for the `vmwareengine_external_address` resource in GCP.

Reference: [Terraform Registry – vmwareengine_external_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_external_address)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `internal_ip` | The internal IP address of a workload VM. | true | true | The internal IP address identifies the workload VM that is mapped to an external address. Only approved internal IP addresses should be used to avoid exposing unintended workloads. | 192.168.0.66 | 192.168.0.99 |
| `parent` | The resource name of the private cloud to create a new external address in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud | true | true | The parent value determines which private cloud the external address belongs to. Using an approved parent helps ensure that the external address is created only within a trusted and approved private cloud. | projects/599444694846/locations/us-west1-a/privateClouds/c | projects/599444694846/locations/us-west1-a/privateClouds/nc |
| `name` | The ID of the external IP Address. | true | true | External address names should follow an approved naming standard so that resources can be clearly identified, audited, and managed consistently. | c | nc |
| `description` | User-provided description for this resource. | false | false | The description is used for documentation and does not directly change the security posture of the external address. | None | None |
