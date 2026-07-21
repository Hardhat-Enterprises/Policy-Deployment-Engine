package terraform.gcp.security.oracle_database.google_oracle_database_cloud_vm_cluster.cidr

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
        {
            "situation_description": "CIDR range is public and exposes the VM cluster.",
            "remedies": [
                "Use private CIDR ranges such as 10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16."
            ]
        },
        {
            "condition": "CIDR must not be public.",
            "attribute_path": ["cidr"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details