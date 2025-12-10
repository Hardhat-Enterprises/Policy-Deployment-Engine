## 🛡️ Policy Deployment Engine: `discovery_engine_sitemap`

This section provides a concise policy evaluation for the `discovery_engine_sitemap` resource in GCP.

Reference: [Terraform Registry – discovery_engine_sitemap](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_sitemap)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | false | None | None | None |
| `data_store_id` | The unique id of the data store. | true | false | None | None | None |
| `uri` | Public URI for the sitemap, e.g. "www.example.com/sitemap.xml". | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
