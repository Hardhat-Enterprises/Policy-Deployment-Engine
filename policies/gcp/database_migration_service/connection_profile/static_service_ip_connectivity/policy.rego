package terraform.gcp.security.database_migration_service.connection_profile.static_service_ip_connectivity
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "Prevent public connectivity via static service IP for Oracle profiles.",
        "remedies":[ "Use forward SSH or private_connectivity instead."]
    },
    {
        "condition": "static_service_ip_connectivity must be unset",
        "attribute_path" : ["oracle",0,"static_service_ip_connectivity"],
        "values" : [[]], # only allow empty array
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details