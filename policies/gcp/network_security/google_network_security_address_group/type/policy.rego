package terraform.gcp.security.network_security.google_network_security_address_group.type
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_address_group.vars

conditions := [
    [
        {
            "situation_description": "Only allow address group IPV4",
            "remedies": ["Set the type to IPV4"]
        },
        {
            "condition": "Address group type must be IPV4",
            "attribute_path": ["type"],
            "values": ["IPV4"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details