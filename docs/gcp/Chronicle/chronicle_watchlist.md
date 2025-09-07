## 🛡️ Policy Deployment Engine: `chronicle_watchlist`

This section provides a concise policy evaluation for the `chronicle_watchlist` resource in GCP.

Reference: [Terraform Registry – chronicle_watchlist](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_watchlist)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Required. Display name of the watchlist. Note that it must be at least one character and less than 63 characters (https://google.aip.dev/148).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entity_population_mechanism`
- Description: (Required) Mechanism to populate entities in the watchlist. Structure is [documented below](#nested_entity_population_mechanism).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The unique identifier for the Chronicle instance, which is the same as the customer ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multiplying_factor`
- Description: (Optional) Optional. Weight applied to the risk score for entities in this watchlist. The default is 1.0 if it is not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the watchlist.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `watchlist_user_preferences`
- Description: (Optional) A collection of user preferences for watchlist UI configuration. Structure is [documented below](#nested_watchlist_user_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `watchlist_id`
- Description: (Optional) Optional. The ID to use for the watchlist, which will become the final component of the watchlist's resource name. This value should be 4-63 characters, and valid characters are /a-z-/.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_entity_population_mechanism"></a>The `entity_population_mechanism` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual`
- Description: (Optional) Entities are added manually. <a name="nested_watchlist_user_preferences"></a>The `watchlist_user_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pinned`
- Description: (Optional) Optional. Whether the watchlist is pinned on the dashboard.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
