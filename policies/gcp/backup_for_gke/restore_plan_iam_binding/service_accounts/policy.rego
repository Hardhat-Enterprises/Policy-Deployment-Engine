package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.service_accounts
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  {
    "situation_description": "Restore Plan IAM members must be allowed service accounts.",
    "remedies": ["Only use allowed service accounts (e.g. *fluent-coder*)."],
    "allowed_pattern": "serviceAccount:.*@fluent-coder-468700-h4.iam.gserviceaccount.com"
  }
]

get_violations(tf_variables, condition) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        member := resource.values.members[_]
        
        # Check if member is a service account (heuristic)
        startswith(member, "serviceAccount:")
        
        # Check against allowed pattern
        not regex.match(condition.allowed_pattern, member)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("IAM binding '%s' includes unauthorized service account '%s'. Must match %s", [
                resource.values.name,
                member,
                condition.allowed_pattern
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
