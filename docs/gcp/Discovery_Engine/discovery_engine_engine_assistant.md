## 🛡️ Policy Deployment Engine: `discovery_engine_assistant`

This section provides a concise policy evaluation for the `discovery_engine_assistant` resource in GCP.

Reference: [Terraform Registry – discovery_engine_assistant](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_assistant)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The name displayed | true | false | Its the name | None | None |
| `collection_id` | The collection ID | true | false | Its the ID | None | None |
| `engine_id` | The Engine ID | true | false | Its the ID | None | None |
| `assistant_id` | The Engine ID | true | false | Its the ID | None | None |
| `description` |  Description for additional information. | true | false | Its the Description | None | None |
| `generation_config` | Configuration for the generation of the assistant response. | true | true | this one affects the response of the assistant. It can cause a data leak if you don't configure it right. Write a policy. | None | None |
| `customer_policy` | Customer policy for the assistant. | true | true | this relates to what the LLM can and cannot say and sanitizes inputs from users. Write a policy. | None | None |
| `web_grounding_type` | The type of web grounding to use. | true | true |  controls how the LLM can grab external data or use internal data. Write a policy. | None | None |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | laws apply based on location | eu, us, global | US-West23 |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
