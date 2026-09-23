package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_apt_gpg_key

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The APT repository is added without a GPG key, so packages from it are installed without any signature verification",
    "remedies" : ["Supply the URI of the repository's GPG key so package signatures are verified"]},
    {
        "condition": "Check that a GPG key is supplied for the APT repository",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"apt",0,"gpg_key"],
        "values" : [null, ""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details