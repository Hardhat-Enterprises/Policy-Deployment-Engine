package terraform.gcp.security.certificate_authority.ca.key_spec 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.ca.vars

conditions := [
    [
    {"situation_description" : "Use of a secure cyrptographic key algorithm",
    "remedies":["Specify an algorithm", "Update system to use a secure key algorithm"]},
    {
        # All current possible values are considered secure (min. 2048 RSA)
        "condition": "Specific algorithm is specified",
        "attribute_path" : ["key_spec",0,"algorithm"], 
        "values" : ["SIGN_HASH_ALGORITHM_UNSPECIFIED"],
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details