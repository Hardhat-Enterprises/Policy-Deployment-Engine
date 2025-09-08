## 🛡️ Policy Deployment Engine: `compute_router_route_policy`

This section provides a concise policy evaluation for the `compute_router_route_policy` resource in GCP.

Reference: [Terraform Registry – compute_router_route_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_route_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `router` | The name of the Cloud Router in which this route policy will be configured. | true | None | None |
| `name` | Name of the route policy. This policy's name, which must be a resource ID segment and unique within all policies owned by the Router | true | None | None |
| `type` | This is policy's type, which is one of IMPORT or EXPORT Possible values are: `ROUTE_POLICY_TYPE_IMPORT`, `ROUTE_POLICY_TYPE_EXPORT`. | false | None | None |
| `region` | Region where the router and NAT reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### terms Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | The evaluation priority for this term, which must be between 0 (inclusive) and 231 (exclusive), and unique within the list. | true | None | None |
| `match` | CEL expression evaluated against a route to determine if this term applies (see Policy Language). Structure is [documented below](#nested_terms_terms_match). | true | None | None |
| `actions` | 'CEL expressions to evaluate to modify a route when this term matches.'\ Structure is [documented below](#nested_terms_terms_actions). | false | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. | false | None | None |
| `description` | Description of the expression | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file | false | None | None |

### actions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. | false | None | None |
| `description` | Description of the expression | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file | false | None | None |
