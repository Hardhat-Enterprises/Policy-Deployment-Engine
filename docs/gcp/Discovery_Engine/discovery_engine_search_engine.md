## 🛡️ Policy Deployment Engine: `discovery_engine_search_engine`

This section provides a concise policy evaluation for the `discovery_engine_search_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_search_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_search_engine)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Required. The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters. | true | None | None |
| `data_store_ids` | The data stores associated with this engine. For SOLUTION_TYPE_SEARCH type of engines, they can only associate with at most one data store. | true | None | None |
| `engine_id` | Unique ID to use for Search Engine App. | true | None | None |
| `collection_id` | The collection ID. | true | None | None |
| `location` | Location. | true | None | None |
| `industry_vertical` | The industry vertical that the engine registers. The restriction of the Engine industry vertical is based on DataStore: If unspecified, default to GENERIC. Vertical on Engine has to match vertical of the DataStore liniked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`, `MEDIA`, `HEALTHCARE_FHIR`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### search_engine_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `search_tier` | The search feature tier of this engine. Defaults to SearchTier.SEARCH_TIER_STANDARD if not specified. Default value is `SEARCH_TIER_STANDARD`. Possible values are: `SEARCH_TIER_STANDARD`, `SEARCH_TIER_ENTERPRISE`. | false | None | None |
| `search_add_ons` | The add-on that this search engine enables. Each value may be one of: `SEARCH_ADD_ON_LLM`. | false | None | None |

### common_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `company_name` | The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features.cd | false | None | None |
