package terraform.gcp.security.iam.folders_policy_binding.policy_kind 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.folders_policy_binding.vars

scenarios_list:= [

    [
        { 
            "situation_description" : "unsupported policy_kind", 
            "remedies": [
                "Currently 'condition' only supports 'PRINCIPAL_ACCESS_BOUNDARY' as a policy_kind value!"
            ]
        },
        {
            "condition" : "c1: unsupported policy_kind",
            "attribute_path" : ["policy_kind"], 
            "values" : ["PRINCIPAL_ACCESS_BOUNDARY"],
            "policy_type" : "whitelist"
        },
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

