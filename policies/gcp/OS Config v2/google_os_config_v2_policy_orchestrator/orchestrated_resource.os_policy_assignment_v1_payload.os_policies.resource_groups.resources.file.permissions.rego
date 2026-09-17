package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_file_permissions

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The managed file is written with a permission mode that grants write access to group or other users, so any local user can modify it after it is placed on the VM",
    "remedies" : ["Use a permission mode that does not grant write access beyond the owner, such as 644 or 755"]},
    {
        "condition": "Check that the file permissions are not group or world writable",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"file",0,"permissions"],
        "values" : ["777","776","775","774","773","772","771","770","767","766","757","756","747","746","737","736","727","726","717","716","707","706","677","666","676","667","637","636","627","626","617","616","607","606","577","576","567","566","537","536","527","526","517","516","507","506","477","476","467","466","437","436","427","426","417","416","407","406"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details