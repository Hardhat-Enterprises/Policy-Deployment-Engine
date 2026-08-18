package terraform.gcp.security.customer_engagement_suite.google_ces_app.client_certificate_settings_tls_certificate
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES client certificate configuration must include a TLS certificate.",
        "remedies":[ "Configure a non-empty TLS certificate."]
    },
    {
        "condition": "TLS certificate must not be empty",
        "attribute_path" : ["client_certificate_settings", "tls_certificate"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details