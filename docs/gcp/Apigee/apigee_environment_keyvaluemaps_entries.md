## 🛡️ Policy Deployment Engine: `apigee_environment_keyvaluemaps_entries`

This section provides a concise policy evaluation for the `apigee_environment_keyvaluemaps_entries` resource in GCP.

Reference: [Terraform Registry – apigee_environment_keyvaluemaps_entries](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment_keyvaluemaps_entries)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Required. Resource URI that can be used to identify the scope of the key value map entries. | true | None | None |
| `value` | Required. Data or payload that is being retrieved and associated with the unique key. | true | None | None |
| `env_keyvaluemap_id` | The Apigee environment keyvalumaps Id associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}/keyvaluemaps/{{keyvaluemap_name}}`. | true | None | None |
