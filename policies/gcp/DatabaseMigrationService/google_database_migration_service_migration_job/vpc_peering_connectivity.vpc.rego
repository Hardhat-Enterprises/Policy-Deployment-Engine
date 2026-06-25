package terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.vpc_peering_connectivity_vpc
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.vars

conditions := [
    [
    {
        "situation_description" : "Require private connectivity: VPC peering allowed.",
        "remedies":[ "Configure vpc_peering_connectivity if reverse SSH is not used."]
    },
    {
        "condition": "VPC peering connectivity required",
        "attribute_path" : ["vpc_peering_connectivity",0,"vpc"],
        "values" : ["dummy-vpc"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
