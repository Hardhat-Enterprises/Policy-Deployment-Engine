## 🛡️ Policy Deployment Engine: `chronicle_watchlist`

This section provides a concise policy evaluation for the `chronicle_watchlist` resource in GCP.

Reference: [Terraform Registry – chronicle_watchlist](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_watchlist)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Required. Display name of the watchlist. Note that it must be at least one character and less than 63 characters (https://google.aip.dev/148). | true | false | None | None | None |
| `entity_population_mechanism` | Mechanism to populate entities in the watchlist. Structure is [documented below](#nested_entity_population_mechanism). | true | true | Manual population can lead to incomplete or outdated watchlists, increasing risk of missing threats. Automated population ensures timely and accurate data. | ['api', 'integration', 'automated'] | ['manual'] |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | true | Restricting Chronicle resources to approved regions ensures compliance with data residency and service availability requirements. | australia-southeast1 | Any location other than 'australia-southeast1', such as 'europe-west3', is considered non-compliant. |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `multiplying_factor` | Optional. Weight applied to the risk score for entities in this watchlist. The default is 1.0 if it is not specified. | false | false | None | None | None |
| `description` | Optional. Description of the watchlist. | false | false | None | None | None |
| `watchlist_user_preferences` | A collection of user preferences for watchlist UI configuration. Structure is [documented below](#nested_watchlist_user_preferences). | false | false | None | None | None |
| `watchlist_id` | Optional. The ID to use for the watchlist, which will become the final component of the watchlist's resource name. This value should be 4-63 characters, and valid characters are /a-z-/. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### entity_population_mechanism Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `manual` | Entities are added manually. | false | true | Manual entry is error-prone and may miss timely threat intelligence, reducing the reliability of the watchlist. | None | Using only manual entity population without automation. |

### watchlist_user_preferences Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pinned` | Optional. Whether the watchlist is pinned on the dashboard. | false | false | None | None | None |
