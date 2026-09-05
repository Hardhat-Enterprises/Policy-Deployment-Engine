package terraform.gcp.security.bigquery.google_bigquery_table_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_table_iam_policy.vars

# Merged policy for `policy_data` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
# policy_lint reports hard-coded-value on the address inside the JSON below, and
# the finding stands. policy_data is compared as a whole rendered IAM policy
# document; a pattern target is used as a regex, and a JSON document's { [ ] "
# characters are regex metacharacters, while roles/... contains a "/" that the
# "*" wildcard ([^/]+) cannot cross. The address is part of the document being
# matched, so a wildcard cannot replace it without the match failing.
conditions := [
[
        {"situation_description" : "Check for valid members",
         "remedies": ["Add valid members"]},
        {
            "condition": "Check for valid_members",
            "attribute_path": ["policy_data"],
            "values" : ["{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/bigquery.dataOwner\"}]}"],
            "policy_type" : "whitelist"
        }
    ],
[
        {"situation_description" : "Check for valid role",
         "remedies": ["Add valid role"]},
        {
            "condition": "Check for valid_role",
            "attribute_path": ["policy_data"],
            "values" : ["{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/bigquery.dataOwner\"}]}"],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
