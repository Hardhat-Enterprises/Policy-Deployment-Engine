package terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.contact_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_quotas.google_cloud_quotas_quota_preference.vars

conditions := [
    [
        {
            "situation_description": "Quota preference is using a contact email outside the approved domains",
            "remedies": [
                "Use a contact email from an approved domain only",
                "Update the Terraform configuration so the contact_email matches an approved pattern"
            ]
        },
        {
            "condition": "Allow quota preferences only for approved contact email patterns",
            "attribute_path": ["contact_email"],
            "values": [
                "*@*",
                [["admin", "testuser"], ["deakin.edu.au", "gmail.com"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details