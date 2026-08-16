package terraform.gcp.security.compute_engine.google_compute_managed_ssl_certificate.managed_domains

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_managed_ssl_certificate.vars

conditions := [
    [
    {"situation_description" : "managed.domains includes an untrusted domain",
    "remedies":[ "Only issue managed SSL certificates for approved, verified domains"]},
    {
        "condition": "Test if managed.domains includes the untrusted domain",
        "attribute_path" : ["managed", 0, "domains"],
        "values" : ["untrusted.example.com."],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
