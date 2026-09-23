package terraform.gcp.security.eventarc.google_eventarc_pipeline.destinations_http_endpoint_uri

import data.terraform.helpers
import data.terraform.gcp.security.eventarc.google_eventarc_pipeline.vars

conditions := [
    [
        {"situation_description" : "The HTTP endpoint destination does not use HTTPS.",
        "remedies":[ "Use an https:// destination URI so message data is delivered over TLS."]},
        {
            "condition": "Require the HTTPS URI scheme",
            "attribute_path" : ["destinations", 0, "http_endpoint", 0, "uri"],
            "values" : ["*://", [["https"]]],
            "policy_type" : "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
