package terraform.gcp.security.bigquery.google_bigquery_dataset.access_domain
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "A dataset access entry grants access to an entire email domain that is not on the approved list, exposing the dataset to every current and future account in that domain.",
         "remedies": ["Replace the domain with one the organisation owns and has approved for dataset sharing", "Or drop the domain entry and grant the specific users or groups that need the data"]},
        {
            "condition": "Check if any is set to example.com",
            "attribute_path" : ["access", "domain"],
            "values" : ["example.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
