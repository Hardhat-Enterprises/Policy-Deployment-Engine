## 🛡️ Policy Deployment Engine: `apigee_addons_config`

This section provides a concise policy evaluation for the `apigee_addons_config` resource in GCP.

Reference: [Terraform Registry – apigee_addons_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_addons_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `org` | Name of the Apigee organization. | true | false | It describes the name of organization and does not have any security impact. | None | None |
| `addons_config` | Addon configurations of the Apigee organization. | false | true | Certain addons_config arguments provide security impact | None | None |

### addons_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `advanced_api_ops_config` | Configuration for the Advanced API Ops add-on. | false | true | advanced_api_ops_config detect, analyze, and alert on API traffic anomalies in real-time, such as unexpected latency spikes or error rate changes  | enabled | disabled |
| `integration_config` | Configuration for the Integration add-on. | false | false | It allows Apigee to integrate with other Google Cloud services and third-party applications and does not have any security impact | None | None |
| `monetization_config` | Configuration for the Monetization add-on. | false | false | It is used to enable or disable the Apigee Monetization add-on for a specific Apigee organization and does not have security impact. | None | None |
| `api_security_config` | Configuration for the API Security add-on. | false | true | It should be enabled to detect API security risks, flag abnormal traffic | enabled | disabled |
| `connectors_platform_config` | Configuration for the Monetization add-on. | false | false | It enable or disable the Integration Connectors platform within an Apigee organization | None | None |
