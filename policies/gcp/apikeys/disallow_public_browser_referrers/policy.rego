package terraform.gcp.security.apikeys.google_apikeys_key.disallow_public_browser_referrers

<<<<<<< HEAD
import data.terraform.gcp.helpers
=======
import data.terraform.helpers
>>>>>>> 3380726 (fixing)
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
        # restrictions[0].browser_key_restrictions[0].allowed_referrers[0]
        "attribute_path" : ["restrictions", 0, "browser_key_restrictions", 0, "allowed_referrers", 0],
        "values" : ["*", "http://*", "https://*"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
