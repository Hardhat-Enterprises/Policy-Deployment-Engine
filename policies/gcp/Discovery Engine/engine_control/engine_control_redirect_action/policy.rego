package terraform.gcp.security.discovery_engine.engine_control.engine_control_redirect_action
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.engine_control.vars

#engine_control_redirect_action

conditions := [
    [
    {
        "situation_description": "Is redirect_action configured correctly?",
        "remedies": ["Ensure that redirect is configured correctly."]
        },
      {
        "condition": "redirect is mis-configured",
        "attribute_path": ["redirect_action", 0, "redirect_uri"],
        "values": ["https://goodexample.com/special-landing-page"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details