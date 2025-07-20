package terraform.gcp.security.certificate_authority.certificate_template.subject_passthrough 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.certificate_template.vars

conditions := [
    [
        {
            "situation_description" : "Subject passthrough is diasabled",
            "remedies":["Disable subject passthrough"]
        },
        {
            "condition": "Subject passthrough is diasabled",
            "attribute_path" : ["identity_constraints",0,"allow_subject_passthrough"],
            "values" : [false],
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details