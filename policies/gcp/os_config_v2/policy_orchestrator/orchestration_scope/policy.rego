package terraform.gcp.security.os_config_v2.policy_orchestrator.orchestration_scope
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "Ensure OS Config Policy Orchestrator Orchestration Scope includes only allowed locations and associated labels",
    "remedies" : ["Remove disallowed locations from orchestration scope location_selector included_locations"]},
    {
        "condition": "Only Sydney and Melbourne are the allowed locations which are included in orchestration scope",
        "attribute_path" : ["orchestration_scope",0,"selectors",0,"location_selector",0,"included_locations"], 
        "values" : ["Sydney","Melbourne"],
        "policy_type" : "whitelist" 
    },
    {
        "condition": "Only Testing labelled environments are allowed in orchestration scope",
        "attribute_path" : ["label",0,"environment"], 
        "values" : ["Test","test","TEST","testing","Testing","TESTING"],
        "policy_type" : "whitelist" 
    },
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details