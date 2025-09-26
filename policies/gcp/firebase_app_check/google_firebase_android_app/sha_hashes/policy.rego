package terraform.gcp.security.firebase.google_firebase_android_app.sha_hashes

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.google_firebase_android_app.vars

conditions := [
    [
        {"situation_description" : "Firebase Android App should have at least one SHA-1 or SHA-256 certificate hash defined for security.",
         "remedies": ["Ensure that either 'sha1_hashes' or 'sha256_hashes' is configured."]},
        {
            "condition": "SHA256 hash is null.",
            "attribute_path" : ["sha256_hashes"],
            "values": [null],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details