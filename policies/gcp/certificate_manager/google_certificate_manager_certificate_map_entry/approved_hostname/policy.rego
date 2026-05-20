package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.approved_hostname

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.vars

conditions := [[
    {
        "situation_description": "When a certificate map entry uses a non-approved hostname, it may attach certificates to hostnames outside the approved organisation domain list.",
        "remedies": "Use an approved hostname for certificate map entries.",
        "condition": "hostname must be an approved value",
        "attribute_path": ["hostname"],
        "values": ["secure.example.com"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details