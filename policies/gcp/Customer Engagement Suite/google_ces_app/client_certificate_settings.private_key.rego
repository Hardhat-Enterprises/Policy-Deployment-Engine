package terraform.gcp.security.customer_engagement_suite.google_ces_app.client_certificate_settings_private_key
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES client certificate configuration must refrence a private key secret.",
        "remedies":[ "Configure a valid secret manager private key reference."]
    },
    {
        "condition": "Private key must not be empty.",
        "attribute_path" : ["client_certificate_settings", "private_key"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details