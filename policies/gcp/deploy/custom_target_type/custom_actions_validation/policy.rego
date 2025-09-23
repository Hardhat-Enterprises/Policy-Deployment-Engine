package terraform.gcp.security.deploy.custom_target_type.custom_actions_validation
import data.terraform.gcp.helpers
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
    ],
    [
        {"situation_description": "Custom Target Type using unauthorized render actions", 
         "remedies": ["Only use company-approved render actions: 'render-action', 'secure-render', 'validated-render'"]},
        {
            "condition": "Render action must be from approved list",
            "attribute_path": ["custom_actions", 0, "render_action"], 
            "values": [
                "render-action",      
                "secure-render",
                "validated-render", 
                "company-standard-render"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details