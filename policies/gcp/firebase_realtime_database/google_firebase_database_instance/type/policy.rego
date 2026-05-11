package terraform.gcp.security.firebase_realtime_database.google_firebase_database_instance.type 
import data.terraform.helpers
import data.terraform.gcp.security.firebase_realtime_database.google_firebase_database_instance.vars

conditions := [
    [
        {
            "situation_description": "region must be set to an approved value",
            "remedies": ["Use an approved Australian region."]
        },
        {
             "condition": "region is in the allow list",
             "attribute_path": ["region"],
             "values": ["australia-southeast1", "australia-southeast2"],
             "policy_type": "whitelist"
        }
    ],
        [
        {
            "situation_description": "Database type must be one of the approved realtime DB's allowed",
            "remedies": ["Use an approved Database type"]
        },
        {
             "condition": "Database type is in allow list",
             "attribute_path": ["type"],
             "values": ["DEFAULT_DATABASE", "USER_DATABASE"],
             "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details