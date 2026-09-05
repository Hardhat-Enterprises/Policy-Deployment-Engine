package terraform.gcp.security.bigquery.google_bigquery_dataset.access_user_by_email
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_dataset.vars

# policy_lint reports hard-coded-value on the address(es) below, and the finding
# stands. This attribute is a LIST, and the pattern policy types read the value as
# a single string (shared.get_target_list regex-matches it), so pointing one at an
# array makes it undefined -- which reads as "no violation", not as an error, and
# the non-compliant example would silently stop being flagged. There is no
# "element whitelist" type in policies/_helpers to check every element of a list
# against an allowed pattern; adding one is what would unblock this.
conditions := [
    [
        {"situation_description" : "A dataset access entry grants an individual account outside the organisation's directory, putting dataset contents in the hands of an identity the org cannot suspend.",
         "remedies": ["Grant an account in the organisation's own directory, one the organisation can suspend or offboard", "Or drop the entry if the account is external and does not need the data"]},
        {
            "condition": "Check if any access entry has invalid user email",
            "attribute_path" : ["access", "user_by_email"],
            "values" : ["admin@example.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
