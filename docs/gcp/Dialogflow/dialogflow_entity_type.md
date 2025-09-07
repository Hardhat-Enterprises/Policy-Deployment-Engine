## 🛡️ Policy Deployment Engine: `dialogflow_entity_type`

This section provides a concise policy evaluation for the `dialogflow_entity_type` resource in GCP.

Reference: [Terraform Registry – dialogflow_entity_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_entity_type)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The name of this entity type to be displayed on the console.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kind`
- Description: (Required) Indicates the kind of entity type. * KIND_MAP: Map entity types allow mapping of a group of synonyms to a reference value. * KIND_LIST: List entity types contain a set of entries that do not map to reference values. However, list entity types can contain references to other entity types (with or without aliases). * KIND_REGEXP: Regexp entity types allow to specify regular expressions in entries values. Possible values are: `KIND_MAP`, `KIND_LIST`, `KIND_REGEXP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_fuzzy_extraction`
- Description: (Optional) Enables fuzzy entity extraction during classification.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entities`
- Description: (Optional) The collection of entity entries associated with the entity type. Structure is [documented below](#nested_entities).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_entities"></a>The `entities` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) The primary value associated with this entity entry. For example, if the entity type is vegetable, the value could be scallions. For KIND_MAP entity types: * A reference value to be used in place of synonyms. For KIND_LIST entity types: * A string that can contain references to other entity types (with or without aliases).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `synonyms`
- Description: (Required) A collection of value synonyms. For example, if the entity type is vegetable, and value is scallions, a synonym could be green onions. For KIND_LIST entity types: * This collection must contain exactly one synonym equal to value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
