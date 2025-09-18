package terraform.gcp.security.gdce.vpn_connection.vpc
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.vpn_connection.vars

conditions := [
    # VPC format validation - blacklist invalid patterns
    [
        {
            "situation_description": "VPN connection uses invalid VPC format.",
            "remedies": ["Use proper VPC format: projects/PROJECT/global/networks/VPC-NAME"]
        },
        {
            "condition": "VPC must not use invalid formats",
            "attribute_path": ["vpc"],
            "values": ["invalid-vpc-format", "", null],  # Blacklist specific invalid patterns
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}