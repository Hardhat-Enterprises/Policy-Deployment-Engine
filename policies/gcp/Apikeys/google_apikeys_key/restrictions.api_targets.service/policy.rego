package terraform.gcp.security.apikeys.google_apikeys_key.restrictions_api_targets_service

import data.terraform.helpers
import data.terraform.gcp.security.apikeys.google_apikeys_key.vars

# Merged `restrictions.api_targets.service`-scoped policy. Each element of
# `conditions` is an independent scenario evaluated on its own by
# helpers.get_multi_summary:
#   1. allowed_api_targets      - api_targets.service must be an approved service
#   2. enforce_key_restrictions - the key must declare at least one restriction
conditions := [
    [
    {
        "situation_description" : "API key is configured for a service that is not in the approved list.",
        "remedies":[
            "Restrict api_targets.service to approved services only."
        ]
    },
    {
        "condition": "Check that api_targets.service is one of the approved services.",
        # restrictions[0].api_targets[0].service
        "attribute_path" : ["restrictions", 0, "api_targets", 0, "service"],
        "values" : [
            "maps.googleapis.com",
            "places.googleapis.com",
            "translate.googleapis.com"
        ],
        "policy_type" : "whitelist"
    }
    ],
    [
    {
        "situation_description" : "API key has no key restrictions configured.",
        "remedies":[
            "Configure at least one restriction block (api_targets, browser_key_restrictions, server_key_restrictions, android_key_restrictions or ios_key_restrictions)."
        ]
    },
    {
        "condition": "Check that restrictions block is present.",
        # If restrictions is null/empty, helper will treat this as a match for blacklist values
        "attribute_path" : ["restrictions", 0, "api_targets"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
