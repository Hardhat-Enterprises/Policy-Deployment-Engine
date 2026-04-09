package terraform.gcp.security.database_migration_service.migration_job.reverse_ssh_connectivity
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

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
    ],
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
    ],
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
    ],
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