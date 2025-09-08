## 🛡️ Policy Deployment Engine: `dialogflow_cx_entity_type`

This section provides a concise policy evaluation for the `dialogflow_cx_entity_type` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_entity_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_entity_type)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the entity type, unique within the agent. | true | None | None |
| `kind` | Indicates whether the entity type can be automatically expanded. * KIND_MAP: Map entity types allow mapping of a group of synonyms to a canonical value. * KIND_LIST: List entity types contain a set of entries that do not map to canonical values. However, list entity types can contain references to other entity types (with or without aliases). * KIND_REGEXP: Regexp entity types allow to specify regular expressions in entries values. Possible values are: `KIND_MAP`, `KIND_LIST`, `KIND_REGEXP`. | true | None | None |
| `auto_expansion_mode` | Represents kinds of entities. * AUTO_EXPANSION_MODE_UNSPECIFIED: Auto expansion disabled for the entity. * AUTO_EXPANSION_MODE_DEFAULT: Allows an agent to recognize values that have not been explicitly listed in the entity. Possible values are: `AUTO_EXPANSION_MODE_DEFAULT`, `AUTO_EXPANSION_MODE_UNSPECIFIED`. | false | None | None |
| `enable_fuzzy_extraction` | Enables fuzzy entity extraction during classification. | false | None | None |
| `redact` | Indicates whether parameters of the entity type should be redacted in log. If redaction is enabled, page parameters and intent parameters referring to the entity type will be replaced by parameter name when logging. | false | None | None |
| `parent` | The agent to create a entity type for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |
| `language_code` | The language of the following fields in entityType: EntityType.entities.value EntityType.entities.synonyms EntityType.excluded_phrases.value If not specified, the agent's default language is used. Many languages are supported. Note: languages must be enabled in the agent before they can be used. | false | None | None |

### entities Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | The primary value associated with this entity entry. For example, if the entity type is vegetable, the value could be scallions. For KIND_MAP entity types: A canonical value to be used in place of synonyms. For KIND_LIST entity types: A string that can contain references to other entity types (with or without aliases). | false | None | None |
| `synonyms` | A collection of value synonyms. For example, if the entity type is vegetable, and value is scallions, a synonym could be green onions. For KIND_LIST entity types: This collection must contain exactly one synonym equal to value. | false | None | None |

### excluded_phrases Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | The word or phrase to be excluded. | false | None | None |
