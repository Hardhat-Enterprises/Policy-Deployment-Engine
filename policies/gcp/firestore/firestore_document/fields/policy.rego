package terraform.gcp.security.firestore_document.fields

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_document.vars
import future.keywords.if

conditions := [
    [
        {
            "situation_description": "Firestore document must include mandatory field 'field1'.",
            "remedies": [
                "Add an object with `name = \"field1\"` to the fields list of the google_firestore_document resource."
            ]
        },
        {
            "condition": "Checks if fields attribute is not an empty string",
            "attribute_path": ["fields"],
            "values": [""],   # 空字符串 → 不合规
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details