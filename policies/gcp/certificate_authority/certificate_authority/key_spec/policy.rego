package terraform.gcp.security.certificate_authority.ca.key_spec 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.ca.vars

conditions := [
    [
        {
            "situation_description" : "Use of a secure cyrptographic key algorithm",
            "remedies":["Specify an algorithm", "Update system to use a secure key algorithm"]
        },
        {
            
            "condition": "Specific algorithm is specified",
            "attribute_path" : ["key_spec",0,"algorithm"], 
            "values" : [
                "RSA_PSS_2048_SHA256",
                "RSA_PSS_3072_SHA256",
                "RSA_PSS_4096_SHA256",
                "RSA_PKCS1_2048_SHA256",
                "RSA_PKCS1_3072_SHA256",
                "RSA_PKCS1_4096_SHA256",
                "EC_P256_SHA256",
                "EC_P384_SHA384"
                ],
            "policy_type" : "blacklist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details