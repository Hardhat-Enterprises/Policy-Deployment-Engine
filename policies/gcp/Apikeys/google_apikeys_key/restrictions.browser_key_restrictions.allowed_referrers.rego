package terraform.gcp.security.apikeys.google_apikeys_key.restrictions_browser_key_restrictions_allowed_referrers

import data.terraform.helpers
import data.terraform.gcp.security.apikeys.google_apikeys_key.vars

conditions := [
    [
    {
        "situation_description" : "Browser key restrictions allow very broad referrers (e.g. * or http://*).",
        "remedies":[
            "Restrict browser_key_restrictions.allowed_referrers to specific trusted domains."
        ]
    },
    {
        "condition": "Check that allowed_referrers does not contain overly broad patterns.",
        # restrictions[0].browser_key_restrictions[0].allowed_referrers -- the whole list.
        # Exact-match blacklist, not "element blacklist": the latter matches by substring,
        # and a legitimate referrer such as "https://example.com/*" contains "*".
        "attribute_path" : ["restrictions", 0, "browser_key_restrictions", 0, "allowed_referrers"],
        "values" : ["*", "http://*", "https://*"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
