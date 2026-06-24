package terraform.gcp.security.database_migration_service.migration_job.reverse_ssh_connectivity_vpc
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

conditions := [
    [
    {
        "situation_description" : "Ensure reverse SSH has VPC defined",
        "remedies":[ "Set VPC in reverse_ssh_connectivity"]
    },
    {
        "condition": "reverse SSH VPC required",
        "attribute_path" : ["reverse_ssh_connectivity",0,"vpc"],
        "values" : ["dummy-vpc"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
