## 🛡️ Policy Deployment Engine: `apigee_api`

This section provides a concise policy evaluation for the `apigee_api` resource in GCP.

Reference: [Terraform Registry – apigee_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_api)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the API proxy. | true | false | It sets the name of API and doesnot have any security impact | None | None |
| `org_id` | The Apigee Organization name associated with the Apigee instance. | true | false | It sets the Organization name of API and doesnot have any security impact | None | None |
| `config_bundle` | Path to the config zip bundle. - - - | true | true | It contains the zip package of  XML configuration files, policies, and code (JS/Java) that define an API proxy or shared flow. | proxies/MyProxy.zip |  |
