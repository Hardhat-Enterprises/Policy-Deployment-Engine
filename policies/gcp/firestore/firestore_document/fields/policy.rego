package terraform.gcp.security.firestore.firestore_document.fields

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_document.vars

#conditions := [
#    [
#        {
#            "situation_description": "Firestore documents must include both 'field1' and 'field2' to satisfy mandatory data schema.",
#            "remedies": [
#                "Add objects with `name = 'field1'` and `name = 'field2'` to the fields list in the google_firestore_document resource block."
#            ]
#        },
#        {
#            "condition": "Checks if fields array contains both field1 and field2",
#            "attribute_path": ["fields"],
#            "values": [["field1", "field2"]],
##            "policy_type": "contains_all"
#            "policy_type": "whitelist"
#        }
#    ]
#]
conditions := [
    # 第一步：检查 field1 是否存在
    [
        {
            "situation_description": "Firestore document is missing mandatory field 'field1'.",
            "remedies": ["Add an object with `name = 'field1'` to the fields list."]
        },
        {
            "condition": "Ensure field1 is present in fields",
            "attribute_path": ["fields"],
            "values": [["field1"]],
            "policy_type": "whitelist"
        }
    ],
    # 第二步：检查 field2 是否存在
    [
        {
            "situation_description": "Firestore document is missing mandatory field 'field2'.",
            "remedies": ["Add an object with `name = 'field2'` to the fields list."]
        },
        {
            "condition": "Ensure field2 is present in fields",
            "attribute_path": ["fields"],
            "values": [["field2"]],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

#message := helpers.get_multi_summary(conditions, vars.variables).message
#details := helpers.get_multi_summary(conditions, vars.variables).details

# compute failing resource names (only root_module)
resource_type := vars.variables.resource_type
resources := [r | r := input.planned_values.root_module.resources[_]; r.type == resource_type]
missing_weekly := { r.name | r := resources[_]; not r.values.weekly_recurrence }

# overwrite message with only failing resources
message := [ sprintf("Resource '%s' does not define `weekly_recurrence`", [name]) | name := missing_weekly[_] ]

# keep original details if you want (or rebuild details similarly)
details := summary.details