package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_policy.vars

# Merged policy for `policy_data` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
    {"situation_description" : "Data Catalog taxonomy IAM policy data contains public members.",
    "remedies":["Remove public members and use approved users, groups, or service accounts only."]},
    {
        "condition": "IAM policy data must not include public principals.",
        "attribute_path" : ["policy_data"],
        "values" : ["\"members\":\\[\"*\"\\]", [["allUsers", "allAuthenticatedUsers"]]],
        "policy_type" : "pattern blacklist"
    }
    ],
[
    {"situation_description" : "Data Catalog taxonomy IAM policy data uses an over-privileged role.",
    "remedies":["Use a least-privilege IAM role approved for Data Catalog taxonomys."]},
    {
        "condition": "IAM policy data must not include over-privileged roles.",
        "attribute_path" : ["policy_data"],
        "values" : ["\"role\":\"roles/*\"", [["datacatalog.admin", "owner", "editor"]]],
        "policy_type" : "pattern blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
