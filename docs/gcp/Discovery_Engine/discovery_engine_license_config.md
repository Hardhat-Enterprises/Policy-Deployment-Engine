## 🛡️ Policy Deployment Engine: `discovery_engine_license_config`

This section provides a concise policy evaluation for the `discovery_engine_license_config` resource in GCP.

Reference: [Terraform Registry – discovery_engine_license_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_license_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Its the Name. | true | false | Its the name | None | None |
| `license_count` | Number of licenses purchased | true | true | It could be a potential legal issue. Write a policy on it if so. | None | None |
| `subscription_tier` | Subscription tier information for the license config. | true | true | Cost/Risk Management: Ensures the correct service tier is used, preventing either over-spending or using a lower tier that might lack necessary enterprise security features. | SUBSCRIPTION_TIER_ENTERPRISE |  |
| `start_date` | Its the start of the licence | true | true | It affects when you can start working. Write a policy. | None | None |
| `subscription_term` | The term you have the subscription active for | true | true | How long you can use the service before you lose access or break TOS. Write a policy. | None | None |
| `license_config_id` | Its the ID. | true | false | Its the ID | None | None |
| `auto_renew` | Whether the license config should be auto renewed when it reaches the end date. | true | true |  this attribute controls whether the license will automatically renew at the end date: While not a direct data security attribute, it's critical financial security/governance control. | None | None |
| `end_date` | Its the End Date of the licence. | true | true | Its the end date before you lose the licence and break TOS or lose acess. Write a policy. | None | None |
| `free_trial` | Whether the license config is for free trial. | true | false | If you run out of free trial, you could end up paying money or losing work. Write a policy | None | None |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | laws apply based on location | eu, us, global | US-West23 |
| `project` | If it is not provided, the provider project is used. | true | false | None | None | None |
