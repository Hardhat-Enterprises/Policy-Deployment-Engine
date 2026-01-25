package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.cross_project_groups
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  {
    "situation_description": "Restore Plan IAM members must not contain cross-project groups.",
    "remedies": ["Remove cross-project groups (ext-, external-, partner-)."]
  }
]

get_violations(tf_variables, condition) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        member := resource.values.members[_]
        
        # Check for cross-project group patterns
        bad_patterns := ["@ext-", "@external-", "@partner-"]
        some pattern in bad_patterns
        contains(member, pattern)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("IAM binding '%s' includes cross-project group '%s'. Only internal groups allowed.", [
                resource.values.name,
                member
            ])
        }
    }
}

message := msg if {
    resources := [r | r := input.planned_values.root_module.resources[_]; r.type == vars.variables.resource_type]
    condition := conditions[0]
    violations := get_violations(vars.variables, condition)
    nc_resources := {v.name | v := violations[_]}
    
    header := sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(resources)])
    nc_list_str := concat(", ", sort([n | n := nc_resources[_]]))
    remedy_str := concat(", ", condition.remedies)
    situation_msg := sprintf("Situation 1: %s", [condition.situation_description])
    
    nc_msg_part := [sprintf("Non-Compliant Resources: %s", [nc_list_str]) | count(nc_resources) > 0]
    pass_msg_part := ["Non-Compliant Resources: None - All passed" | count(nc_resources) == 0]
    det_msg_part := [v.message | v := violations[_]]
    remedy_msg_part := [sprintf("Potential Remedies: %s", [remedy_str]) | count(nc_resources) > 0]
    
    msg := array.concat(
        array.concat(
            array.concat([header, situation_msg], nc_msg_part),
            pass_msg_part
        ),
        array.concat(det_msg_part, remedy_msg_part)
    )
}

details := {}
