package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_yum_gpg_keys

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "A GPG key for the YUM repository is fetched over plain HTTP, so the key used to verify package signatures could itself be substituted in transit",
    "remedies" : ["Use HTTPS URIs for the repository's GPG keys"]},
    {
        "condition": "Check that no GPG key URI uses plain HTTP",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"yum",0,"gpg_keys"],
        "values" : ["http://"],
        "policy_type" : "element blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details