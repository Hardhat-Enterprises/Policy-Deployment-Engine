package terraform.gcp.security.customer_engagement_suite.google_ces_app.client_certificate_settings_passphrase
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES client certificate passphrases must not be empty.",
        "remedies":[ "Configure a non-empty client certificate passphrase."]
    },
    {
        "condition": "Passphrase must not be empty.",
        "attribute_path" : ["client_certificate_settings", "passphrase"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details