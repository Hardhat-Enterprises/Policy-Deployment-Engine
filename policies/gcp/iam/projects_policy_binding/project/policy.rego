package terraform.gcp.security.iam.projects_policy_binding.project
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.projects_policy_binding.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unsupported project", # name/descriptiopn of the scenario
            "remedies": [
                "Please choose from an approved project!"
            ] # fix messages
        },
        {
            "condition" : "c1: unsupported project", # condition name
            "attribute_path" : ["project"], # nested path
            "values" : ["project_id_c", "project_id"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

