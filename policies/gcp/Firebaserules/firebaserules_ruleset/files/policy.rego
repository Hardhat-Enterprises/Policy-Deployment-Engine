package terraform.gcp.security.firebaserules_ruleset.files

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebaserules.vars

conditions := [
    [
        {
            "situation_description": "google_firebaserules_ruleset must include at least one file with both 'name' and 'content' keys.",
            "remedies": [
                "Add an object { name = \"<filename>\", content = \"<rules>\" } to the files list in the google_firebaserules_ruleset resource block."
            ]
        },
        {
            "condition": "Checks if every file object contains both name and content",
            "attribute_path": ["files"],
            "values": ["name", "content"],
            "policy_type": "contains_all_keys"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details