## 🛡️ Policy Deployment Engine: `apigee_env_references`

This section provides a concise policy evaluation for the `apigee_env_references` resource in GCP.

Reference: [Terraform Registry – apigee_env_references](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_env_references)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource id of this reference. Values must match the regular expression [\w\s-.]+. | true | false | It sets the name of the environment reference and does not have any security impact. | None | None |
| `env_id` | The Apigee environment group associated with the Apigee environment, in the format organizations/{{org_name}}/environments/{{env_name}}. | true | false | It sets the environment ID and does not have any security impact. | None | None |
| `resource_type` | The type of resource referred to by this reference. Valid values are KeyStore or TrustStore. | true | true | resource_type must be set to KeyStore or TrustStore to ensure Apigee environment references are linked to a valid TLS/SSL certificate store, preventing misconfigured or unauthorized certificate usage. An invalid value can cause TLS/SSL misconfigurations leading to man-in-the-middle attacks. | KeyStore | InvalidType |
| `refers` | The id of the resource to which this reference refers. Must be the id of a resource that exists in the parent environment and is of the given resourceType. | true | false | It sets the reference ID pointing to an existing resource and does not have any security impact. | None | None |
| `description` | Optional. A human-readable description of this reference. | false | false | It is an optional free-text field and does not have any security impact. | None | None |
