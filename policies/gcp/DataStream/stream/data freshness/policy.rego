package terraform.gcp.security.datastream.stream.data_freshness # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.stream.vars
conditions := [
    [
        {
            "situation_description": "Data Freshness is configured with compliant retention value.",
            "remedies": [
                "Ensure 'data_freshness' is one of the allowed values: 300s, 600s, or 900s."
            ]
        },
        {
            "condition": "Checks that the BigQuery destination 'data_freshness' setting is one of the allowed values.",
            "attribute_path": ["destination_config", 0, "bigquery_destination_config", 0, "data_freshness"],
            "values": ["300s", "600s", "900s"],
            "policy_type": "enum"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details