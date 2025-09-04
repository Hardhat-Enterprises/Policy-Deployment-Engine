package terraform.gcp.security.os_config_v2.policy_orchestrator.orchestration_scope
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "Ensure OS Config Policy Orchestrator Orchestration Scope includes only allowed locations",
    "remedies" : ["Remove disallowed locations from orchestration scope location_selector included_locations"]},
    {
        "condition": "some disallowed locations are included in orchestration scope location_selector included_locations",
        "attribute_path" : ["orchestration_scope",0,"selectors",0,"location_selector",0,"included_locations"], 
        "values" : ["Sydney","Melbourne"],
        "policy_type" : "whitelist" 
    },
    {
        "condition": "some disallowed locations are included in orchestration scope location_selector included_locations",
        "attribute_path" : ["label",0,"environment"], 
        "values" : ["Test","test","TEST","testing","Testing","TESTING"],
        "policy_type" : "whitelist" 
    },
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details