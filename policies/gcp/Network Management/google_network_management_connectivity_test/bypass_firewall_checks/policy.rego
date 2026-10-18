package terraform.gcp.security.network_management.google_network_management_connectivity_test.bypass_firewall_checks

import data.terraform.helpers
import data.terraform.gcp.security.network_management.google_network_management_connectivity_test.vars

conditions := [
    [
    {"situation_description" : "bypass_firewall_checks is enabled, masking real firewall-enforced reachability",
    "remedies":[ "Set bypass_firewall_checks to false so the test reflects actual firewall behaviour"]},
    {
        "condition": "Test if bypass_firewall_checks is true",
        "attribute_path" : ["bypass_firewall_checks"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
