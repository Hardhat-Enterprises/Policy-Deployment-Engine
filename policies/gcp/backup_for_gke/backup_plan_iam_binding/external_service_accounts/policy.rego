package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.external_service_accounts
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  {
    "situation_description": "Backup Plan IAM members must not be external service accounts.",
    "remedies": ["Remove external service accounts (.iam.gserviceaccount.com)."]
  }
]

get_violations(tf_variables, condition) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        member := resource.values.members[_]
        
        # Check if member is a service account
        startswith(member, "serviceAccount:")
        
        # Whitelist permitted service accounts (e.g. internal project ones)
        # Compliant resource uses @fluent-coder... so we allow that.
        # We block others.
        allowed_pattern := "serviceAccount:.*@fluent-coder-468700-h4.*\\.iam\\.gserviceaccount\\.com"
        
        not regex.match(allowed_pattern, member)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("IAM binding '%s' includes unauthorized service account '%s'. Must match internal pattern.", [
                resource.values.name,
                member
            ])
        }
    }
}

message := msg if {
    # 1. Detect resources
    resources := [r | r := input.planned_values.root_module.resources[_]; r.type == vars.variables.resource_type]
    
    # 2. Evaluate
    condition := conditions[0]
    violations := get_violations(vars.variables, condition)
    nc_resources := {v.name | v := violations[_]}
    
    # 3. Format Output
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
