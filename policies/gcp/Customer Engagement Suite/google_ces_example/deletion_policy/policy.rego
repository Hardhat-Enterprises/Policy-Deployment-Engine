package terraform.gcp.security.customer_engagement_suite.google_ces_example.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_example.vars


conditions := [
    [
        {
            "situation_description" : "Customer Engagement Suite examples must be protected from accidental deletion.",
            "remedies":[
                "Set deletion_policy to PREVENT"
                ]
        },
        {
            "condition": "Deletion policy must be PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": [
                "PREVENT"
                ],
            "policy_type" : "whitelist" 
        }
    ]
]
 

    
#message := helpers.get_multi_summary(conditions, vars.variables).message

#details := helpers.get_multi_summary(conditions, vars.variables).details

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details