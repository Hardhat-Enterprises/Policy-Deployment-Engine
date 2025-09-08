## 🛡️ Policy Deployment Engine: `discovery_engine_target_site`

This section provides a concise policy evaluation for the `discovery_engine_target_site` resource in GCP.

Reference: [Terraform Registry – discovery_engine_target_site](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_target_site)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `provided_uri_pattern` | The user provided URI pattern from which the `generated_uri_pattern` is generated. | true | None | None |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | None | None |
| `data_store_id` | The unique id of the data store. | true | None | None |
| `type` | The possible target site types. Possible values are: `INCLUDE`, `EXCLUDE`. | false | None | None |
| `exact_match` | If set to false, a uri_pattern is generated to include all pages whose address contains the provided_uri_pattern. If set to true, an uri_pattern is generated to try to be an exact match of the provided_uri_pattern or just the specific page if the provided_uri_pattern is a specific one. provided_uri_pattern is always normalized to generate the URI pattern to be used by the search engine. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
