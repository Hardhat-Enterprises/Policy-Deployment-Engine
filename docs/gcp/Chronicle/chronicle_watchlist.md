## 🛡️ Policy Deployment Engine: `chronicle_watchlist`

This section provides a concise policy evaluation for the `chronicle_watchlist` resource in GCP.

Reference: [Terraform Registry – chronicle_watchlist](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_watchlist)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Required. Display name of the watchlist. Note that it must be at least one character and less than 63 characters (https://google.aip.dev/148). | true | None | None |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | None | None |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | None | None |
| `multiplying_factor` | Optional. Weight applied to the risk score for entities in this watchlist. The default is 1.0 if it is not specified. | false | None | None |
| `description` | Optional. Description of the watchlist. | false | None | None |
| `watchlist_id` | Optional. The ID to use for the watchlist, which will become the final component of the watchlist's resource name. This value should be 4-63 characters, and valid characters are /a-z-/. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### entity_population_mechanism Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `manual` | Entities are added manually. | false | None | None |

### watchlist_user_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pinned` | Optional. Whether the watchlist is pinned on the dashboard. | false | None | None |
