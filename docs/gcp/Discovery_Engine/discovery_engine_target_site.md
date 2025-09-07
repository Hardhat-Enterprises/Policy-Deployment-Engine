## 🛡️ Policy Deployment Engine: `discovery_engine_target_site`

This section provides a concise policy evaluation for the `discovery_engine_target_site` resource in GCP.

Reference: [Terraform Registry – discovery_engine_target_site](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_target_site)

---

## 1. Argument Reference

### `provided_uri_pattern`
- Description: (Required) The user provided URI pattern from which the `generated_uri_pattern` is generated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_id`
- Description: (Required) The unique id of the data store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The possible target site types. Possible values are: `INCLUDE`, `EXCLUDE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) If set to false, a uri_pattern is generated to include all pages whose address contains the provided_uri_pattern. If set to true, an uri_pattern is generated to try to be an exact match of the provided_uri_pattern or just the specific page if the provided_uri_pattern is a specific one. provided_uri_pattern is always normalized to generate the URI pattern to be used by the search engine.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
