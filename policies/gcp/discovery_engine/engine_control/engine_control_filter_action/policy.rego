package terraform.gcp.security.discovery_engine.engine_control.engine_control_filter_action
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.engine_control.vars

#engine_control_filter
#Can be set to private later, but imgaine its set to only show public for now or something idk.

conditions := [
    [
    {
        "situation_description": "Is filter set to public?",
        "remedies": ["Ensure that it is set to public"]
        },
      {
        "condition": "filter is mis-configured",
        "attribute_path": ["filter_action", 0, "filter"],
        "values": ["documentType = 'public'"],
        "policy_type": "whitelist"
      }
    ],
    [
    {
        "situation_description": "Is it set to the correct datastore?",
        "remedies": ["Ensure that it is set to the correct datastore"]
        },
      {
        "condition": "datastore is mis-configured",
        "attribute_path": ["filter_action", 0, "data_store"],
        "values": ["c-data-store-id"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details