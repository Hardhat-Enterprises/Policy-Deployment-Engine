package terraform.gcp.security.datastream.private_connection.subnet_validation
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.private_connection.vars

conditions := [
    [
        {
            "situation_description": "The subnet CIDR block is not within the valid range.",
            "remedies": [
                "Ensure that the 'subnet' field is set to a valid CIDR block from the approved range, e.g., '10.0.0.0/24'."
            ]
        },
        {
            "condition": "Checks if the subnet CIDR block is within an approved range.",
            "attribute_path": ["vpc_peering_config", 0, "subnet"],
            "values": ["10.0.0.0/24", "10.0.0.0/29", "192.168.0.0/16"]
            "policy_type": "whitelist"
        }
    ]
]


summary := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
