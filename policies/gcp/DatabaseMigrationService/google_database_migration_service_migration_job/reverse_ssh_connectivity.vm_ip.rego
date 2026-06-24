package terraform.gcp.security.database_migration_service.migration_job.reverse_ssh_connectivity_vm_ip
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

conditions := [
    [
    {
        "situation_description" : "Ensure reverse SSH has VM IP defined",
        "remedies":[ "Set vm_ip in reverse_ssh_connectivity"]
    },
    {
        "condition": "reverse SSH VM IP required",
        "attribute_path" : ["reverse_ssh_connectivity",0,"vm_ip"],
        "values" : ["dummy-ip"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
