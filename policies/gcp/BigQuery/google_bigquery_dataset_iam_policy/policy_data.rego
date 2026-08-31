package terraform.gcp.security.BigQuery.google_bigquery_dataset_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_iam_policy.vars

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
        {"situation_description" : "The dataset's IAM policy grants a role to allUsers, making the dataset readable by anyone on the internet, signed in or not.",
         "remedies": ["Remove access from allUsers"]},
        {
            "condition": "Check policy_data for a binding that grants a role to allUsers",
            "attribute_path" : ["policy_data"],
            "values" : "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/bigquery.dataViewer\"}]}", 
            "policy_type" : "Blacklist"
        }
    ],
[
        {"situation_description" : "The dataset's IAM policy document does not match the approved binding set, so bindings have been added, removed or altered outside review.",
         "remedies": ["Restore policy_data to the reviewed binding set, or take the change through review before applying it", "If you only need to add one role, use google_bigquery_dataset_iam_binding or _iam_member instead — google_bigquery_dataset_iam_policy replaces the whole document"]},
        {
            "condition": "Check policy_data matches the approved binding set",
            "attribute_path" : ["policy_data"],
            "values" : "{\"bindings\":[{\"members\":[\"user:fakeuser@example.com\"],\"role\":\"roles/bigquery.dataViewer\"}]}", 
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
