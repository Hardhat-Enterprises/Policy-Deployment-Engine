## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway_application`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway_application` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway_application)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `security_gateway_id` | ID of the Security Gateway resource this belongs to. | true | false | Associating the application with a specific gateway ensures proper access control and routing. | ['default-sg', 'default-sg-spa', 'default-sg-spa-proxy', 'svc.corp.example.com'] | ['unauthorized-gateway-1', 'test-sg', 'sg-dev'] |
| `application_id` | User-settable Application resource ID. Must start with a letter, 4-63 characters, can contain /a-z-/ and end with a number or letter. | true | false | Used to uniquely identify the application within the Security Gateway. | ['gateway-app-c', 'app-production', 'app-spa-api'] | ['1invalid-app', 'app!', 'app_with_space'] |
| `endpoint_matchers` | Endpoint matchers to define which hostnames and ports the application uses. | true | true | Ensures only authorized application endpoints are accessible through the Security Gateway. | ['svc.corp.example.com:443', 'svc.corp.example.com:8443'] | ['svc.corp.example.com:80', 'example.com:8080'] |
| `upstreams` | Optional list of upstream resources to forward traffic to. | false | true | Traffic must be routed securely and through approved upstream networks. |  |  |
| `display_name` | Optional human-readable name for the application. | false | false | Helps admins identify the application in the UI. | ['My SPA App', 'Gateway App Production'] | ['', None] |
| `logging_enabled` | Enable logging for auditing and monitoring. | false | true | Logging ensures application access can be monitored. | ['true'] | ['false'] |
| `project` | Project ID if different from provider default. | false | false | Allows associating the application with a specific project. | ['smooth-verve-467716-v1'] | ['other-project-id'] |

### upstreams Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `egress_policy` | Routing policy to define allowed egress regions. | false | true | Traffic must stay within approved regions for compliance. | ['australia-southeast1', 'australia-southeast2'] | ['us-west1', 'us-east1'] |
| `network` | Network for forwarding traffic. | false | true | Only approved networks should be used for security reasons. | ['projects/smooth-verve-467716-v1/global/networks/prod-vpc', 'projects/smooth-verve-467716-v1/global/networks/shared-services-vpc'] | ['projects/smooth-verve-467716-v1/global/networks/dev-vpc', 'projects/smooth-verve-467716-v1/global/networks/test-vpc'] |
