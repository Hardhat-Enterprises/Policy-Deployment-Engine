## 🛡️ Policy Deployment Engine: `apigee_environment`

This section provides a concise policy evaluation for the `apigee_environment` resource in GCP.

Reference: [Terraform Registry – apigee_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource ID of the environment. | true | false | It sets the name of the environment and does not have any security impact. | None | None |
| `org_id` | The Apigee Organization associated with the Apigee environment, in the format organizations/{{org_name}}. | true | false | It sets the organization association and does not have any direct security impact. | None | None |
| `display_name` | Display name of the environment. | false | false | It sets the display name only and does not have any security impact. | None | None |
| `description` | Description of the environment. | false | false | It sets the description only and does not have any security impact. | None | None |
| `deployment_type` | Deployment type supported by the environment. Possible values are: DEPLOYMENT_TYPE_UNSPECIFIED, PROXY, ARCHIVE. | false | false | deployment_type defines how API proxies are deployed in the environment. The risk is unpredictability not exposure, data leakage or privilege escalation, so it is not a security concern. | None | None |
| `api_proxy_type` | API Proxy type supported by the environment. Possible values are: API_PROXY_TYPE_UNSPECIFIED, PROGRAMMABLE, CONFIGURABLE. | false | false | api_proxy_type is an architectural constraint that defines the execution model of API proxies. It does not control access permissions, encryption, network exposure, or any CIA security threat within the Apigee platform. | None | None |
| `type` | Environment type. Possible values are: ENVIRONMENT_TYPE_UNSPECIFIED, BASE, INTERMEDIATE, COMPREHENSIVE. | false | false | type defines the feature set and scale tier available to the environment. It controls performance capabilities not security mechanisms such as access control or encryption. | None | None |
| `forward_proxy_uri` | URI of the forward proxy to be applied to the runtime instances in this environment. Must be in the format of {scheme}://{hostname}:{port}. | false | true | Using insecure schemes such as ftp, ssh, or telnet for the forward proxy exposes API traffic to interception and man-in-the-middle attacks. Only http:// or https:// schemes should be used. | https://proxy.example.com:8080 | ftp://bad-proxy.example.com:8080 |
| `node_config` | NodeConfig for setting the min/max number of nodes associated with the environment. | false | false | It sets the node scaling configuration and does not have any security impact. | Refer to child argument | Refer to child argument |
| `client_ip_resolution_config` | The algorithm to resolve the client IP. This affects Analytics, API Security, and other features that use the client IP. | false | true | Incorrect client IP resolution can allow malicious clients to spoof their IP address, undermining API Security, Analytics, and rate limiting features. | Refer to child argument | Refer to child argument |

### node_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_node_count` | The minimum total number of gateway nodes reserved for all instances that have the specified environment. | false | false | It sets the minimum node count for scaling and does not have any security impact. | None | None |
| `max_node_count` | The maximum total number of gateway nodes reserved for all instances that have the specified environment. | false | false | It sets the maximum node count for scaling and does not have any security impact. | None | None |

### client_ip_resolution_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `header_index_algorithm` | Resolves the client IP based on a custom header. | false | true | The header index algorithm determines which IP in the X-Forwarded-For header is used as the client IP. Incorrect configuration can allow IP spoofing. | Refer to child argument | Refer to child argument |

###   header_index_algorithm Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `ip_header_name` | The name of the header to extract the client IP from. Currently only X-Forwarded-For is supported. | true | false | It sets the header name for IP extraction. Only X-Forwarded-For is currently supported and does not have additional security impact. | None | None |
  | `ip_header_index` | The index of the IP in the X-Forwarded-For header. Positive indices choose from the left (client-supplied), negative indices choose from the right (last verified hop). | true | true | Using a non-negative index (0, 1, 2...) reads client-supplied IPs from the X-Forwarded-For header, which can be spoofed by malicious clients. Setting ip_header_index to -1 ensures the last verified hop is used, which cannot be spoofed. | -1 | 1 |
