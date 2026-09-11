package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.vars

conditions := [
    [
        {
            "situation_description": "The NetApp storage pool deletion policy must prevent accidental deletion.",
            "remedies": [
                "Set 'deletion_policy' to 'PREVENT' in the NetApp storage pool configuration."
            ]
        },
        {
            "condition": "'deletion_policy' does not prevent deletion.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details