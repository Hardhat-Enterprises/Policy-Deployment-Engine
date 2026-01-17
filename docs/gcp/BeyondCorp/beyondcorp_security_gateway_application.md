## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway_application`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway_application` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway_application)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `endpoint_matchers` | Required. Endpoint matchers associated with an application. A combination of hostname and ports as endpoint matcher is used to match the application. Match conditions for OR logic. An array of match conditions to allow for multiple matching criteria. The rule is considered a match if one the conditions are met. The conditions can be one of the following combination (Hostname), (Hostname & Ports) EXAMPLES: Hostname - ("*.abc.com"), ("xyz.abc.com") Hostname and Ports - ("abc.com" and "22"), ("abc.com" and "22,33") etc Structure is [documented below](#nested_endpoint_matchers). | true | true | This is to ensure that only authorized applications can be accessed through the Security Gateway. | None | None |
| `security_gateway_id` | ID of the Security Gateway resource this belongs to. | true | false | Security through the Security Gateway is a core part of BeyondCorp, and associating applications with a specific gateway is essential for proper access control and routing. | None | None |
| `application_id` | User-settable Application resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter. | true | false | This id corresponds to the 'resource name' of the Application and is used to uniquely identify it within the Security Gateway. | None | None |
| `display_name` | Optional. An arbitrary user-provided name for the Application resource. Cannot exceed 64 characters. | false | false | This is the name that will be displayed in the UI and can help administrators easily identify and manage the application. | None | None |
| `upstreams` | Optional. List of upstream resources to forward traffic to. Structure is [documented below](#nested_upstreams). | false | true | Specifying upstream resources ensures that traffic is routed securely and according to organizational policies. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This field allows for the specification of a project ID, which can be useful for organizing resources and managing access control. | None | None |
| `logging_enabled` | Enables logging for the Security Gateway Application. | false | true | Logging must be enabled to allow auditing of application access and support security monitoring. | true | false |

### endpoint_matchers Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hostname` | Required. Hostname of the application. | true | false | This needs to be specified to ensure proper routing and access control. | None | None |
| `ports` | Optional. Ports of the application. | false | true | Specifying the ports is crucial for ensuring that only the intended traffic is allowed through the Security Gateway. | 443, 8443 | 80, 8080 |

### upstreams Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `egress_policy` | Optional. Routing policy information. Defines the region of egress to ensure secure and compliant traffic flow. | false | true | Traffic must be restricted to approved regions for compliance and security reasons. | australia-southeast1, australia-southeast2 | us-west1, us-west2 |
| `network` | Network to forward traffic to. Structure is [documented below](#nested_upstreams_upstreams_network). | false | true | Upstream networks must be approved to ensure proper security segmentation. | projects/smooth-verve-467716-v1/global/networks/prod-vpc,projects/smooth-verve-467716-v1/global/networks/shared-services-vpc | projects/smooth-verve-467716-v1/global/networks/test-vpc,projects/smooth-verve-467716-v1/global/networks/dev-vpc |
