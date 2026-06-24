package terraform.gcp.security.deploy.custom_target_type.custom_actions_deploy_action
import data.terraform.helpers
import data.terraform.gcp.security.deploy.custom_target_type.vars

conditions := [
    [
        {"situation_description": "Custom Target Type using unauthorized deploy actions",
         "remedies": ["Only use company-approved deploy actions: 'deploy-action', 'secure-deploy', 'validated-deploy'"]},
        {
            "condition": "Deploy action must be from approved list",
            "attribute_path": ["custom_actions", 0, "deploy_action"],
            "values": [
                "deploy-action",     
                "secure-deploy", 
                "validated-deploy",
                "company-standard-deploy"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
