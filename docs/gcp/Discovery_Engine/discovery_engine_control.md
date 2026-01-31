## 🛡️ Policy Deployment Engine: `discovery_engine_target_site`

This section provides a concise policy evaluation for the `discovery_engine_target_site` resource in GCP.

Reference: [Terraform Registry – discovery_engine_target_site](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_target_site)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name ` | Its the Name. | true | false | Its the name | None | None |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | laws apply based on location | eu, us, global | US-West23 |
| `solution_type` | The solution type that the control belongs to. | true | false | Just technical stuff, not security related technical | None | None |
| `engine_id` | The engine to add the control to. | false | false | Just ID | None | None |
| `control_id` | The engine to add the control to. | false | false | Just ID | None | None |
| `redirect_action` | could be used to send to unsafe external sites. | false | false | None | None | None |
| `filter_action` |  filters out results that shouldn't be shown. Data leakage. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
