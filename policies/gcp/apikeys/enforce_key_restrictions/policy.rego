package terraform.gcp.security.apikeys.google_apikeys_key.require_restrictions

import data.terraform.gcp.helpers
import data.terraform.gcp.security.apikeys.google_apikeys_key.vars

conditions := [
    [
    {
        "situation_description" : "API key has no key restrictions configured.",
        "remedies":[
            "Configure at least one restriction block (api_targets, browser_key_restrictions, server_key_restrictions, android_key_restrictions or ios_key_restrictions)."
        ]
    },
    {
        "condition": "Check that restrictions block is present.",
        # restrictions is the top-level attribute in google_apikeys_key values
        "attribute_path" : ["restrictions"],
        # If restrictions is null/empty, helper will treat this as a match for blacklist values
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
