package terraform.gcp.security.network_security.network_security_address_group.purpose
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_address_group.vars

conditions := [
    [
        {
            "situation_description": "Only allow purpose value CLOUD_ARMOR",
            "remedies": ["Set the purpose to CLOUD_ARMOR"]
        },
        {
            "condition": "Address group purpose must be CLOUD_ARMOR",
            "attribute_path": ["purpose"],
            "values": ["CLOUD_ARMOR"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details