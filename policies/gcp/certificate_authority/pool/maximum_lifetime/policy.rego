package terraform.gcp.security.certificate_authority.pool.maximum_lifetime 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.pool.vars

conditions := [
    [
        {
            "situation_description" : "Reasonable lifetime set for issued certificates",
            "remedies":["Set certificate liftime to less than 90 days"]
        },
        {
            "condition": "Certificate lifespan is less than 90 days",
            "attribute_path" : ["issuance_policy",0,"maximum_lifetime"],
            # 90 days, 60 days, 30 days, 7 days  
            "values" : ["7776000s", "5184000s", "2592000s","604800s"],
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details