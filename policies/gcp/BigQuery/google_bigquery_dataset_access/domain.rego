package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.domain
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "This access grant opens the dataset to an entire email domain rather than a named principal, admitting every account in that domain, including ones created later.",
         "remedies": ["Restrict the grant to a domain the organisation owns and has approved for dataset sharing", "Or replace the domain grant with the specific users or groups that need the data"]},
        {
            "condition": "Check for correct domain",
            "attribute_path" : ["domain"],
            "values" : ["valid.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details