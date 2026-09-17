package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_apt_gpg_key

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The GPG key for the APT repository is fetched over plain HTTP, so the key used to verify package signatures could itself be substituted in transit",
    "remedies" : ["Use an HTTPS URI for the repository GPG key"]},
    {
        "condition": "Check that the APT repository GPG key is fetched over HTTPS",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"apt",0,"gpg_key"],
        "values" : ["*://*", [["https"]]],
        "policy_type" : "pattern whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details