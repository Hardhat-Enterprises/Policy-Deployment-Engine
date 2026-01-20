package terraform.gcp.security.apikeys.google_apikeys_key.allowed_api_targets

<<<<<<< HEAD
import data.terraform.gcp.helpers
=======
import data.terraform.helpers
>>>>>>> 3380726 (fixing)
import data.terraform.gcp.security.apikeys.google_apikeys_key.vars

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
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
