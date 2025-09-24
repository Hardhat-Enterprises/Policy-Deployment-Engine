package terraform.gcp.security.firebase.android_app.sha256_hashes_presence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.android_app.sha256_hashes_presence.vars

conditions := [
    [
        {
            "situation_description": "Firebase Android App is missing SHA256 hashes.",
            "remedies": [
                "Ensure sha256_hashes are provided for Firebase Android Apps to verify app authenticity."
            ]
        },
        {
            "condition": "The 'sha256_hashes' attribute is not set or is empty.",
            "attribute_path": ["sha256_hashes"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details