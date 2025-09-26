package terraform.gcp.security.dataproc.cluster

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc.cluster.vars

conditions = [
    [
        {"situation_description" : "Dataproc cluster has public IP addresses enabled.",
         "remedies": [ "Set 'internal_ip_only' to 'true'."]},
        {
            "condition": "Checks if the cluster is not set to internal IP only.",
            "attribute_path" : ["cluster_config", 0, "gce_cluster_config", 0, "internal_ip_only"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ],
    [
        {"situation_description" : "Dataproc cluster does not use a Customer-Managed Encryption Key (CMEK).",
         "remedies": [ "Provide a valid KMS key name in 'encryption_config.kms_key_name'."]},
        {
            "condition": "Checks if a CMEK is not configured.",
            "attribute_path" : ["cluster_config", 0, "encryption_config", 0, "kms_key_name"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details