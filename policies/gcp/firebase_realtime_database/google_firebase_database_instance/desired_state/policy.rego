package terraform.gcp.security.firebase_realtime_database.google_firebase_database_instance.desired_state  
import data.terraform.helpers
import data.terraform.gcp.security.firebase_realtime_database.google_firebase_database_instance.vars

conditions := [
    [
        {
            "situation_description": "Database instance must be a valid desired state",
            "remedies": ["Set desired state to be active"]
        },
        {
             "condition": "desired state is ACTIVE",
             "attribute_path" : ["desired_state"], 
             "values" : ["ACTIVE"],
             "policy_type": "whitelist"
        }
    ]

]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details