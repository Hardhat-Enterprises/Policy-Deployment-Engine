package terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.reverse_ssh_connectivity_vm
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.vars

conditions := [
    [
    {
        "situation_description" : "Require private connectivity: reverse SSH allowed. Ensure reverse SSH has VM, IP, VPC, and port defined",
        "remedies":[ "Configure reverse_ssh_connectivity. Set vm, vm_ip, vpc and vm_port in reverse_ssh_connectivity."]
    },
    {
        "condition": "reverse SSH VM must be fully configured",
        "attribute_path" : ["reverse_ssh_connectivity",0,"vm"],
        "values" : ["dummy-vm"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
