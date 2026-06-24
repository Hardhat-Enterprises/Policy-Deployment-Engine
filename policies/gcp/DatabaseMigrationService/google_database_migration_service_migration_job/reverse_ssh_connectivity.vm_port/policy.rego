package terraform.gcp.security.database_migration_service.migration_job.reverse_ssh_connectivity_vm_port
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

conditions := [
    [
    {
        "situation_description" : "Ensure reverse SSH has VM port defined",
        "remedies":[ "Set vm_port in reverse_ssh_connectivity"]
    },
    {
        "condition": "reverse SSH VM port required",
        "attribute_path" : ["reverse_ssh_connectivity",0,"vm_port"],
        "values" : [123], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
