package terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag_iam_policy.policy_data_members
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag_iam_policy.vars

conditions := [
    [
    {"situation_description" : "Data Catalog policy tag IAM policy data contains public members.",
    "remedies":["Remove public members and use approved users, groups, or service accounts only."]},
    {
        "condition": "IAM policy data must not include public principals.",
        "attribute_path" : ["policy_data"],
        "values" : ["\"members\":\\[\"*\"\\]", [["allUsers", "allAuthenticatedUsers"]]],
        "policy_type" : "pattern blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
