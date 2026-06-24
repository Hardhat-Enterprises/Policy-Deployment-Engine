package terraform.gcp.security.deploy.custom_target_type.custom_actions_render_action
import data.terraform.helpers
import data.terraform.gcp.security.deploy.custom_target_type.vars

conditions := [
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
