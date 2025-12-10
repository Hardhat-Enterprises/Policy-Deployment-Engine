## 🛡️ Policy Deployment Engine: `discovery_engine_search_engine`

This section provides a concise policy evaluation for the `discovery_engine_search_engine` resource in GCP.

Reference: [Terraform Registry – discovery_engine_search_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_search_engine)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Required. The display name of the engine. Should be human readable. UTF-8 encoded string with limit of 1024 characters. | true | false | Name | None | None |
| `data_store_ids` | The data stores associated with this engine. For SOLUTION_TYPE_SEARCH type of engines, they can only associate with at most one data store. | true | false | ID | None | None |
| `search_engine_config` | Configurations for a Search Engine. Structure is [documented below](#nested_search_engine_config). | true | false | Logistics | None | None |
| `engine_id` | Unique ID to use for Search Engine App. | true | false | IDs | None | None |
| `collection_id` | The collection ID. | true | false | IDs | None | None |
| `location` | Location. | true | true | Location affects data laws and regulations | None | None |
| `industry_vertical` | The industry vertical that the engine registers. The restriction of the Engine industry vertical is based on DataStore: If unspecified, default to GENERIC. Vertical on Engine has to match vertical of the DataStore liniked to the engine. Default value is `GENERIC`. Possible values are: `GENERIC`, `MEDIA`, `HEALTHCARE_FHIR`. | false | true | Needs to be set to the correct type | GENERIC | HEALTHCARE_FHIR |
| `common_config` | Common config spec that specifies the metadata of the engine. Structure is [documented below](#nested_common_config). | false | false | logistics | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Needed to work | None | None |

### search_engine_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `search_tier` | The search feature tier of this engine. Defaults to SearchTier.SEARCH_TIER_STANDARD if not specified. Default value is `SEARCH_TIER_STANDARD`. Possible values are: `SEARCH_TIER_STANDARD`, `SEARCH_TIER_ENTERPRISE`. | false | false | None | None | None |
| `search_add_ons` | The add-on that this search engine enables. Each value may be one of: `SEARCH_ADD_ON_LLM`. | false | false | None | None | None |

### common_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `company_name` | The name of the company, business or entity that is associated with the engine. Setting this may help improve LLM related features.cd | false | false | None | None | None |
