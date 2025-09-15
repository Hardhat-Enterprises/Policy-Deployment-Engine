package terraform.gcp.security.firestore_document.fields

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore documents must include both 'field1' and 'field2' to satisfy mandatory data schema.",
            "remedies": [
                "Add objects with `name = 'field1'` and `name = 'field2'` to the fields list in the google_firestore_document resource block."
            ]
        },
        {
            "condition": "Checks if fields array contains both field1 and field2",
            "attribute_path": ["fields"],
            "values": [["field1", "field2"]],
            "policy_type": "contains_all"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details