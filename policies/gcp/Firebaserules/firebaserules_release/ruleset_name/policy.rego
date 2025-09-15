package terraform.gcp.security.firebaserules_release.ruleset_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebaserules.vars

conditions := [
    [
        {
            "situation_description": "google_firebaserules_release.ruleset_name must be a fully-qualified Ruleset ID: projects/{project}/rulesets/{ruleset}.",
            "remedies": [
                "Set 'ruleset_name' to the full self_link or id of the google_firebaserules_ruleset resource, e.g. google_firebaserules_ruleset.my.ruleset_id."
            ]
        },
        {
            "condition": "Checks if ruleset_name matches the required full path pattern",
            "attribute_path": ["ruleset_name"],
            "values": ["^projects/[^/]+/rulesets/[^/]+$"],
            "policy_type": "regex"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details