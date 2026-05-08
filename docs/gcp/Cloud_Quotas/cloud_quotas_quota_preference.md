## 🛡️ Policy Deployment Engine: `cloud_quotas_quota_preference`

This section provides a concise policy evaluation for the `cloud_quotas_quota_preference` resource in GCP.

Reference: [Terraform Registry – cloud_quotas_quota_preference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_quotas_quota_preference)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The name of the service to which the quota preference is applied. | true | false | Implemented. A whitelist policy was written so only approved services can be used. This is a simple fixed-value control and matches the whitelist policy type. | service = "compute.googleapis.com" | service = "run.googleapis.com" |
| `quota_id` | The id of the quota to which the quota preference is applied. A quota id is unique in the service. Example: `CPUS-per-project-region`. | true | false | Implemented. A whitelist policy was written so only approved quota IDs can be used. | quota_id = "CPUS-per-project-region" | quota_id = "INVALID-QUOTA-ID" |
| `quota_config` | The preferred quota configuration. Structure is documented below. | true | false | Partially implemented. The project implemented a policy for `preferred_value` only. Output-only fields were not written as preventive policies. | None | None |
| `parent` | The parent of the quota preference. Allowed parents are "projects/[project-id / number]" or "folders/[folder-id / number]" or "organizations/[org-id / number]". | true | false | Implemented. A pattern whitelist policy was written so only approved parent paths can be used. | parent = "projects/my-project-name" | parent = "projects/not-approved-project" |
| `name` | The resource name of the quota preference. Required except in the CREATE requests. | false | false | Not implemented. `name` was used as a message identifier in some tests, but no separate control policy was written because it is not the main governance field. | None | None |
| `dimensions` | The dimensions that this quota preference applies to. The key of the map entry is the name of a dimension, such as "region", "zone", "network_id", and the value of the map entry is the dimension value. | false | false | Implemented. A whitelist policy was written for `dimensions.region` to allow only approved Australian regions. | dimensions = { region = "australia-southeast1" } | dimensions = { region = "us-east1" } |
| `justification` | The reason / justification for this quota preference. | false | false | Implemented. A whitelist policy was written to allow only approved justification text. | justification = "Required for approved academic workload" | justification = "Need more quota quickly" |
| `contact_email` | An email address that can be used for quota related communication between the Google Cloud and the user in case the Google Cloud needs further information to make a decision on whether the user preferred quota can be granted. | false | false | Implemented. A pattern whitelist policy was written for approved email domains. During testing, pattern wildcard constraints required explicit handling, so the final rule was domain-focused rather than a full free-form email validator. | contact_email = "admin@deakin.edu.au" | contact_email = "admin@yahoo.com" |
| `ignore_safety_checks` | The list of quota safety checks to be ignored. Default value is `QUOTA_SAFETY_CHECK_UNSPECIFIED`. Possible values are: `QUOTA_SAFETY_CHECK_UNSPECIFIED`, `QUOTA_DECREASE_BELOW_USAGE`, `QUOTA_DECREASE_PERCENTAGE_TOO_HIGH`. | false | false | Implemented. A blacklist policy was written to block unsafe safety-check bypass values. | ignore_safety_checks = "QUOTA_SAFETY_CHECK_UNSPECIFIED" | ignore_safety_checks = "QUOTA_DECREASE_BELOW_USAGE" |

### quota_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `preferred_value` | The preferred value. Must be greater than or equal to -1. If set to -1, it means the value is "unlimited". | true | false | Implemented. A range policy was written to allow only approved values within a safe range. | quota_config { preferred_value = 200 } | quota_config { preferred_value = 1000 } |
| `state_detail` | (Output) Optional details about the state of this quota preference. | false | false | Not implemented. This is an output-only field and not suitable for preventive Terraform plan policy. | None | None |
| `granted_value` | (Output) Granted quota value. | false | false | Not implemented. This is an output-only field and not suitable for preventive Terraform plan policy. | None | None |
| `trace_id` | (Output) The trace id that the Google Cloud uses to provision the requested quota. This trace id may be used by the client to contact Cloud support to track the state of a quota preference request. The trace id is only produced for increase requests and is unique for each request. The quota decrease requests do not have a trace id. | false | false | Not implemented. This is an output-only field and not suitable for preventive Terraform plan policy. | None | None |
| `annotations` | The annotations map for clients to store small amounts of arbitrary data. Do not put PII or other sensitive information here. | false | false | Not implemented. The generated schema shows `annotations` under `quota_config`, but no reliable plan-based policy was completed for it in this project. The Terraform test setup used during implementation did not yield a working validation path for this argument. | None | None |
| `request_origin` | (Output) The origin of the quota preference request. | false | false | Not implemented. This is an output-only field and not suitable for preventive Terraform plan policy. | None | None |
