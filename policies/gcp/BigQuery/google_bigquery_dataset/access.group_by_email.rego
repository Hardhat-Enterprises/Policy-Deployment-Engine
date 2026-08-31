package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_group_by_email
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

# policy_lint reports hard-coded-value on the address(es) below, and the finding
# stands. This attribute is a LIST, and the pattern policy types read the value as
# a single string (shared.get_target_list regex-matches it), so pointing one at an
# array makes it undefined -- which reads as "no violation", not as an error, and
# the non-compliant example would silently stop being flagged. There is no
# "element whitelist" type in policies/_helpers to check every element of a list
# against an allowed pattern; adding one is what would unblock this.
conditions := [
    [
        {"situation_description" : "Incorrect Email",
         "remedies": ["Change to valid email address"]},
        {
            "condition": "Check if any access entry has invalid group email",
            "attribute_path" : ["access", "group_by_email"],
            "values" : ["example@company.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
