package terraform.gcp.security.firebase_app_check.google_firebase_android_app.sha_hashes

# Security Control: Enforce SHA-256 certificate fingerprint configuration for Android Apps.
#
# Firebase Android apps use SHA-256 certificate fingerprints to verify app authenticity
# and prevent unauthorized apps from accessing Firebase services. Without configured
# SHA-256 hashes, Firebase cannot validate that requests originate from legitimate
# app instances, allowing potential impersonation attacks where malicious apps could
# access your Firebase backend resources.
#
# Each Android app must have at least one SHA-256 certificate hash (debug, release,
# or both) to enable proper App Check verification and protect against unauthorized access.
#
# Reference: https://firebase.google.com/docs/android/setup#register-app

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_android_app.vars

conditions := [
  [
    {"situation_description": "Firebase Android App should have at least one SHA-256 certificate hash defined for security.",
     "remedies": ["Ensure that 'sha256_hashes' is configured with valid certificate fingerprints."]},
    {
      "condition": "SHA256 hash is null or empty.",
      "attribute_path": ["sha256_hashes"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

deny contains msg if {
    msg := message[_]
    not startswith(msg, "Total ")
    count(details) > 0
}
