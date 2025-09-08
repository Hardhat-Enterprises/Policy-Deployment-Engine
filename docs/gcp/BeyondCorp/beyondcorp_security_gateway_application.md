## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway_application`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway_application` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway_application)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `security_gateway_id` | ID of the Security Gateway resource this belongs to. | true | None | None |
| `application_id` | User-settable Application resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter. | true | None | None |
| `display_name` | Optional. An arbitrary user-provided name for the Application resource. Cannot exceed 64 characters. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### endpoint_matchers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Required. Hostname of the application. | true | None | None |
| `ports` | Optional. Ports of the application. | false | None | None |

### upstreams Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `egress_policy` | Optional. Routing policy information. Structure is [documented below](#nested_upstreams_upstreams_egress_policy). | false | None | None |
| `network` | Network to forward traffic to. Structure is [documented below](#nested_upstreams_upstreams_network). | false | None | None |

### egress_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `regions` | Required. List of regions where the application sends traffic to. | true | None | None |

### network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Required. Network name is of the format: `projects/{project}/global/networks/{network}` | true | None | None |
