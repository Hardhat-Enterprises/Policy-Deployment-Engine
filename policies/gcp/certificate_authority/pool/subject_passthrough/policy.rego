package terraform.gcp.security.certificate_authority.pool.subject_passthrough 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.pool.vars

conditions := [
    [
        {
            "situation_description" : "Subject passthrough is diasabled",
            "remedies":["Disable subject passthrough"]
        },
        {
            "condition": "Subject passthrough is diasabled",
            "attribute_path" : ["issuance_policy",0,"identity_constraints",0,"allow_subject_passthrough"],
            "values" : [false],
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details