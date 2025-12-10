## 🛡️ Policy Deployment Engine: `chronicle_rule_deployment`

This section provides a concise policy evaluation for the `chronicle_rule_deployment` resource in GCP.

Reference: [Terraform Registry – chronicle_rule_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_rule_deployment)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | true | Restricting Chronicle resources to approved regions ensures compliance with data residency and service availability requirements. | australia-southeast1 | Any location other than 'australia-southeast1', such as 'europe-west3', is considered non-compliant. |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `rule` | The Rule ID of the rule. | true | false | None | None | None |
| `enabled` | Whether the rule is currently deployed continuously against incoming data. | false | false | None | None | None |
| `alerting` | Whether detections resulting from this deployment should be considered alerts. | true | true | Enabling alerting ensures that important security detections are not silently ignored and are surfaced for investigation. | True | False |
| `archived` | The archive state of the rule deployment. Cannot be set to true unless enabled is set to false i.e. archiving requires a two-step process: first, disable the rule by setting 'enabled' to false, then set 'archive' to true. If set to true, alerting will automatically be set to false. If currently set to true, enabled, alerting, and run_frequency cannot be updated. | false | false | None | None | None |
| `run_frequency` | The run frequency of the rule deployment. Possible values: LIVE HOURLY DAILY | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
