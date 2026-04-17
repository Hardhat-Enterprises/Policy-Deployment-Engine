package terraform.gcp.security.network_security.network_security_address_group.items
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_address_group.vars

conditions := [
    [
        {
            "situation_description": "Only allow specific IP address 10.10.0.1/30 in address group items",
            "remedies": ["Set items to ['10.10.0.1/30']"]
        },
        {
            "condition": "Address group items must be 10.10.0.1/30",
            "attribute_path": ["items"],
            "values": ["10.10.0.1/30"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details