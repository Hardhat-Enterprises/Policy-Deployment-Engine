## 🛡️ Policy Deployment Engine: `apigee_env_references`

This section provides a concise policy evaluation for the `apigee_env_references` resource in GCP.

Reference: [Terraform Registry – apigee_env_references](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_env_references)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Required. The resource id of this reference. Values must match the regular expression [\w\s-.]+. | true | None | None |
| `resource_type` | The type of resource referred to by this reference. Valid values are 'KeyStore' or 'TrustStore'. | true | None | None |
| `refers` | Required. The id of the resource to which this reference refers. Must be the id of a resource that exists in the parent environment and is of the given resourceType. | true | None | None |
| `env_id` | The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`. | true | None | None |
| `description` | Optional. A human-readable description of this reference. | false | None | None |
