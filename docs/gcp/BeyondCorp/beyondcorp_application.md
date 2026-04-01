## 🛡️ Policy Deployment Engine: `beyondcorp_application`

This section provides a concise policy evaluation for the `beyondcorp_application` resource in GCP.

Reference: [Terraform Registry – beyondcorp_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_application)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `endpoint_matchers` | Required. Endpoint matchers associated with an application. A combination of hostname and ports as endpoint matcher is used to match the application. Match conditions for OR logic. An array of match conditions to allow for multiple matching criteria. The rule is considered a match if one the conditions are met. The conditions can be one of the following combination (Hostname), (Hostname & Ports) EXAMPLES: Hostname - ("*.abc.com"), ("xyz.abc.com") Hostname and Ports - ("abc.com" and "22"), ("abc.com" and "22,33") etc Structure is [documented below](#nested_endpoint_matchers). | true | true | This ensures that only the intended application endpoints are matched, reducing the risk of unauthorized access. | None | None |
| `security_gateways_id` | Part of `parent`. See documentation of `projectsId`. | true | false | The security_gateways_id is necessary for resource organization but does not directly affect security. | None | None |
| `application_id` | Optional. User-settable Application resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter. | true | false | This id corresponds to the 'resource name' of the Application and is used to uniquely identify it within the Security Gateway. | None | None |
| `display_name` | Optional. An arbitrary user-provided name for the Application resource. Cannot exceed 64 characters. | false | false | This is just the name of the resource and does not impact security. | None | None |
| `upstreams` | Optional. List of which upstream resource(s) to forward traffic to. Structure is [documented below](#nested_upstreams). | false | false | Specifying upstream resources is crucial for ensuring that traffic is properly routed and managed. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This is the project in which the resource is created. It does not directly impact security. | None | None |
| `egress_policy` | The egress policy to apply to the application. Structure is [documented below](#nested_egress_policy). | false | true | This policy defines the egress rules for the application, which is important for controlling outbound traffic. | None | None |
| `network` | The network that the application is associated with. Structure is [documented below](#nested_network). | false | true | The network configuration is crucial for ensuring proper traffic routing and security. | None | None |

### endpoint_matchers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hostname` | Required. Hostname of the application. | true | false | The hostname is essential for identifying the application endpoint, but does not directly impact security. | None | None |
| `ports` | Optional. Ports of the application. | false | true | This ports field specifies which ports are open for the application, directly affecting the security posture by limiting exposure to only necessary ports. | 4443 , 8443 | 8080, 9090 |

### upstreams Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `egress_policy` | Optional. Routing policy information. Structure is [documented below](#nested_upstreams_upstreams_egress_policy). | false | false | This is just the egress policy for the upstream and does not impact security. | None | None |
| `network` | Network to forward traffic to. Structure is [documented below](#nested_upstreams_upstreams_network). | false | false | This policy specifies the network to which traffic is forwarded, which is important for ensuring proper routing and security. | None | None |

### egress_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `regions` | Required. List of regions where the application sends traffic to. | true | false | The region of the egress policy is important for compliance and latency considerations, but does not directly impact security. | australia-southeast1, australia-southeast2 | us-central1, us-east1 |

### network Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Required. Network name is of the format: `projects/{project}/global/networks/{network}` | true | true | The network name specifies which network the application is associated with, directly impacting security by defining the network boundaries. | projects/my-proj/global/networks/prod-vpc, projects/my-proj/global/networks/shared-services-vpc | projects/my-proj/global/networks/default, projects/my-proj/global/networks/test-vpc |
