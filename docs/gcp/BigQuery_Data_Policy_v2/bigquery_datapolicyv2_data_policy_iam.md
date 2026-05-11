## `bigquery_datapolicyv2_data_policy_iam`

This section covers the `bigquery_datapolicyv2_data_policy_iam` resource group in GCP.

Reference: [Terraform Registry – bigquery_datapolicyv2_data_policy_iam](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/bigquery_datapolicyv2_data_policy_iam)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Used to find the parent data policy. If omitted, it can be parsed from the parent resource identifier. | false | false | Location identifies the parent data policy. | None | None |
| `data_policy_id` | ID of the parent data policy. | true | false | Identifier only. | None | None |
| `project` | Project ID for the parent data policy. | false | false | Project selector only. | None | None |
| `member/members` | Identities granted the IAM role on the data policy. | true | true | Members control who receives access through the IAM binding or member resource. | Set member or members to specific users, groups, or service accounts. | Include public principals such as `allUsers` or `allAuthenticatedUsers`. |
| `role` | IAM role granted on the data policy. | true | true | Role determines the level of access granted on the protected data. | Use a role such as `roles/bigquerydatapolicy.maskedReader` or `roles/bigquerydatapolicy.viewer` as needed. | Use `roles/bigquerydatapolicy.rawDataReader`. |
| `policy_data` | IAM policy document used by the policy resource. | false | false | Policy document container only. | None | None |
