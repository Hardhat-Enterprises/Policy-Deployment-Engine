package terraform.gcp.security.iam.access_boundary_policy.availability_condition
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "empty availability_condition.expression", 
            "remedies": ["availability_condition.expression should not be empty and in Common Expression Language!"] 
        },
        {
            "condition" : "c1: empty rules.access_boundary_rule.availability_condition.expression", 
            "attribute_path" : ["rules", 0, "access_boundary_rule", 0, "availability_condition", 0, "expression"], 
            "values" : [""], 
            "policy_type" : "blacklist" 
        }
    ],
    [
        { 
            "situation_description" : "default availability_condition.expression", 
            "remedies": ["The default availability_condition.expression should be used to validate access level!"] 
        },
        {
            "condition" : "c1: default condition expression", 
            "attribute_path" : ["rules", 0, "access_boundary_rule", 0, "availability_condition", 0, "expression"], 
            "values" : ["request.matchAccessLevels(google_project.project-c.org_id, [google_access_context_manager_access_level.test-access-c.name])"], 
            "policy_type" : "whitelist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details
