## 🛡️ Policy Deployment Engine: `chronicle_rule_deployment`

This section provides a concise policy evaluation for the `chronicle_rule_deployment` resource in GCP.

Reference: [Terraform Registry – chronicle_rule_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_rule_deployment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | None | None |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | None | None |
| `rule` | The Rule ID of the rule. | true | None | None |
| `enabled` | Whether the rule is currently deployed continuously against incoming data. | false | None | None |
| `alerting` | Whether detections resulting from this deployment should be considered alerts. | false | None | None |
| `archived` | The archive state of the rule deployment. Cannot be set to true unless enabled is set to false i.e. archiving requires a two-step process: first, disable the rule by setting 'enabled' to false, then set 'archive' to true. If set to true, alerting will automatically be set to false. If currently set to true, enabled, alerting, and run_frequency cannot be updated. | false | None | None |
| `run_frequency` | The run frequency of the rule deployment. Possible values: LIVE HOURLY DAILY | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
