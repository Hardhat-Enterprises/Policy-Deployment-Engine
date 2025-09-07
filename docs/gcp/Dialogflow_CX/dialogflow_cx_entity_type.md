## 🛡️ Policy Deployment Engine: `dialogflow_cx_entity_type`

This section provides a concise policy evaluation for the `dialogflow_cx_entity_type` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_entity_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_entity_type)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the entity type, unique within the agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kind`
- Description: (Required) Indicates whether the entity type can be automatically expanded. * KIND_MAP: Map entity types allow mapping of a group of synonyms to a canonical value. * KIND_LIST: List entity types contain a set of entries that do not map to canonical values. However, list entity types can contain references to other entity types (with or without aliases). * KIND_REGEXP: Regexp entity types allow to specify regular expressions in entries values. Possible values are: `KIND_MAP`, `KIND_LIST`, `KIND_REGEXP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entities`
- Description: (Required) The collection of entity entries associated with the entity type. Structure is [documented below](#nested_entities).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_expansion_mode`
- Description: (Optional) Represents kinds of entities. * AUTO_EXPANSION_MODE_UNSPECIFIED: Auto expansion disabled for the entity. * AUTO_EXPANSION_MODE_DEFAULT: Allows an agent to recognize values that have not been explicitly listed in the entity. Possible values are: `AUTO_EXPANSION_MODE_DEFAULT`, `AUTO_EXPANSION_MODE_UNSPECIFIED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_phrases`
- Description: (Optional) Collection of exceptional words and phrases that shouldn't be matched. For example, if you have a size entity type with entry giant(an adjective), you might consider adding giants(a noun) as an exclusion. If the kind of entity type is KIND_MAP, then the phrases specified by entities and excluded phrases should be mutually exclusive. Structure is [documented below](#nested_excluded_phrases).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_fuzzy_extraction`
- Description: (Optional) Enables fuzzy entity extraction during classification.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redact`
- Description: (Optional) Indicates whether parameters of the entity type should be redacted in log. If redaction is enabled, page parameters and intent parameters referring to the entity type will be replaced by parameter name when logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create a entity type for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language_code`
- Description: (Optional) The language of the following fields in entityType: EntityType.entities.value EntityType.entities.synonyms EntityType.excluded_phrases.value If not specified, the agent's default language is used. Many languages are supported. Note: languages must be enabled in the agent before they can be used. <a name="nested_entities"></a>The `entities` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The primary value associated with this entity entry. For example, if the entity type is vegetable, the value could be scallions. For KIND_MAP entity types: A canonical value to be used in place of synonyms. For KIND_LIST entity types: A string that can contain references to other entity types (with or without aliases).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `synonyms`
- Description: (Optional) A collection of value synonyms. For example, if the entity type is vegetable, and value is scallions, a synonym could be green onions. For KIND_LIST entity types: This collection must contain exactly one synonym equal to value. <a name="nested_excluded_phrases"></a>The `excluded_phrases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The word or phrase to be excluded.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
