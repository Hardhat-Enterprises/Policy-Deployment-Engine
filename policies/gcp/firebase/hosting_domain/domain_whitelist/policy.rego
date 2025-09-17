package terraform.gcp.security.firebase.hosting_domain.domain_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.hosting_domain.vars

conditions := [
    [
    {
        "situation_description" : "Firebase Hosting site uses a domain outside the approved whitelist",
        "remedies":[ "Configure the site to use only approved custom domains" ]
    },
    {
        "condition": "Check if site domain is in the approved list",
        "attribute_path" : ["values", "triggers", "default_url"],
        "values" : ["example.com", "app.example.com"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
