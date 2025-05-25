package terraform.gcp.security.certificate_authority.certificate_template.alt_names_passthrough 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.certificate_template.vars

conditions := [
    [
        {
            "situation_description" : "Alt names passthrough is diasabled",
            "remedies":["Disable alt names passthrough"]
        },
        {
            "condition": "Alt names passthrough is diasabled",
            "attribute_path" : ["identity_constraints",0,"allow_subject_alt_names_passthrough"],
            "values" : [false],
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details