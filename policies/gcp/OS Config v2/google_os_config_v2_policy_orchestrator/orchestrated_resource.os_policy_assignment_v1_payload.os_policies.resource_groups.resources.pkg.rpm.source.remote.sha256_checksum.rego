package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_pkg_rpm_source_remote_sha256_checksum

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "A remote RPM package is installed without a checksum, so the VM installs whatever the remote server returns with root privileges and a substituted package would go undetected",
    "remedies" : ["Supply the SHA256 checksum of the remote package so its integrity is verified before installation"]},
    {
        "condition": "Check that a checksum is supplied for the remote rpm package",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"pkg",0,"rpm",0,"source",0,"remote",0,"sha256_checksum"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details