## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `security_gateway_id` | Optional. User-settable SecurityGateway resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter. | true | None | None |
| `display_name` | Optional. An arbitrary user-provided name for the SecurityGateway. Cannot exceed 64 characters. | false | None | None |
| `location` | , Deprecated) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. Must be omitted or set to `global`. ~> **Warning:** `location` is deprecated and will be removed in a future major release. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### hubs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `region` |  | none | None | None |
| `internet_gateway` | Internet Gateway configuration. Structure is [documented below](#nested_hubs_hub_internet_gateway). | false | None | None |

### internet_gateway Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `assigned_ips` | (Output) Output only. List of IP addresses assigned to the Cloud NAT. | none | None | None |
