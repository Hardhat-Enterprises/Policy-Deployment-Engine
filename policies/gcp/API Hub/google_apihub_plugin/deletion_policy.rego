package terraform.gcp.security.api_hub.google_apihub_plugin.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin.vars

conditions := [
    [
        {
            "situation_description": "The API Hub plugin is not protected from deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the plugin from accidental deletion."
            ],
        },
        {
            "condition": "Deletion policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist",
        },
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
