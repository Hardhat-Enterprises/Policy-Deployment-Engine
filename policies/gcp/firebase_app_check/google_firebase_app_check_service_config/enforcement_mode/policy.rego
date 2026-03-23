package terraform.gcp.security.firebase_app_check.google_firebase_app_check_service_config.enforcement_mode

# Security Control: Enforce ENFORCED mode for Firebase App Check Service Configuration.
#
# Firebase App Check enforcement mode controls how your backend services handle requests
# from unverified clients. When set to 'UNENFORCED' or 'OFF', your backend will accept
# requests from ANY client, including potentially malicious apps that haven't passed
# App Check verification. This completely bypasses App Check's protection mechanism,
# leaving your Firebase services (Firestore, Realtime Database, Cloud Functions, etc.)
# vulnerable to abuse, data scraping, and unauthorized access.
#
# Setting enforcement_mode to 'ENFORCED' ensures that only verified, legitimate app
# instances can access your backend resources, providing critical protection against
# automated abuse and unauthorized clients.
#
# Reference: https://firebase.google.com/docs/app-check/custom-resource-backend

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_service_config.vars

conditions := [
  [
    {"situation_description" : "Firebase App Check enforcement mode is not set to ENFORCED.",
     "remedies": ["Set enforcement_mode to 'ENFORCED' to actively reject unverified requests."]},
    {
      "condition": "enforcement_mode is not ENFORCED.",
      "attribute_path" : ["enforcement_mode"],
      "values" : ["ENFORCED"],
      "policy_type" : "whitelist"
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
