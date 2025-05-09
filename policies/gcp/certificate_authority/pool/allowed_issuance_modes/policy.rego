package terraform.gcp.security.certificate_authority.pool.allowed_issuance_modes 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.pool.vars

conditions := [
    [
    {"situation_description" : "Enforce best practice of utilising config based issuance",
    "remedies":["Configure config based issuance"]},
    {
        "condition": "CSR based issuance is disallowed",
        "attribute_path" : ["issuance_policy",0,"allowed_issuance_modes",0,"allow_config_based_issuance"], 
        "values" : [true],
        "policy_type" : "whitelist" 
    }
    ],
    [
    {"situation_description" : "CSR based issuance is disallowed",
    "remedies":["Disable CSR based issuance"]},
    {
        "condition": "CSR based issuance is disallowed",
        "attribute_path" : ["issuance_policy",0,"allowed_issuance_modes",0,"allow_csr_based_issuance"], 
        "values" : [false],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details