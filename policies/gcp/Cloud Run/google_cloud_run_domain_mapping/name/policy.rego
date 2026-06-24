package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.name
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars


conditions := [
    [
    {
            "situation_description": "Cloud Run domain mapping name does not use an approved company domain",
            "remedies": [
                "Change the domain name to an approved company domain",
                "Use a domain that matches the required naming pattern"
            ]
        },
    {
            "condition": "Domain name must match the approved company domain pattern",
            "attribute_path": ["name"],
            "values": ["app.company.com"],
            "policy_type": "whitelist"
        }

    ]
]
   

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

