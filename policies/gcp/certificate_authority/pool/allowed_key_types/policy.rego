package terraform.gcp.security.certificate_authority.pool.allowed_key_types 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.pool.vars

conditions := [
    [
    {"situation_description" : "Use of a secure cyrptographic key algorithm",
    "remedies":["Update system to be compatiable with 2048 bit RSA", "Update to use ECC"]},
    {
        "condition": "Key size is greater than 2048",
        "attribute_path" : ["issuance_policy",0,"allowed_key_types",0,"rsa",0,"min_modulus_size"], 
        "values" : [2048,null],
        "policy_type" : "range" 
    },
    {
        "condition": "Use of ECC Algorithm",
        "attribute_path" : ["issuance_policy",0,"allowed_key_types",0,"elliptic_curve",0,"signature_algorithm"], 
        "values" : ["ECDSA_P384","EDDSA_25519","ECDSA_P256"], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details