package terraform.gcp.security.database_migration_service.migration_job.static_ip_connectivity
import data.terraform.gcp.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

conditions := [
    [
    {
        "situation_description" : "Prevent public connectivity via static_ip_connectivity.",
        "remedies":[ "Do not configure static_ip_connectivity. Use reverse SSH or VPC peering instead."]
    },
    {
        "condition": "static_ip_connectivity must be unset",
        "attribute_path" : ["static_ip_connectivity"],
        "values" : [[]], # only allow empty array
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details