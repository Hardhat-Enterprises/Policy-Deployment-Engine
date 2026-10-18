package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_exec_enforce_file_remote_sha256_checksum

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
    {"situation_description" : "Remote files used by the enforce execution stage must have a SHA256 checksum for integrity verification",
    "remedies" : ["Provide the SHA256 checksum of the remote file"]},
    {
        "condition": "Check if the remote file has a SHA256 checksum",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"exec",0,"enforce",0,"file",0,"remote",0,"sha256_checksum"],
        "values" : ["0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details