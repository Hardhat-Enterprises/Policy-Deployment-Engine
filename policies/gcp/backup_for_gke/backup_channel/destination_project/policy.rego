package terraform.gcp.security.backup_for_gke.backup_channel.destination_project
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_channel.vars

conditions := [
  {
    "situation_description": "GKE Backup Channel destination_project must be a dedicated backup project.",
    "remedies": ["Set the destination_project to start with 'projects/backup-'."],
    "pattern": "^projects/backup-.*"
  }
]

# Custom validation rule for Regex matching
get_violations(tf_variables, condition) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        # Attribute access
        val := resource.values.destination_project
        
        # Regex check
        not regex.match(condition.pattern, val)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("Destination project '%s' invalid. Must match pattern: %s", [val, condition.pattern])
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
    
    # Conditional parts
    nc_msg_part := [sprintf("Non-Compliant Resources: %s", [nc_list_str]) | count(nc_resources) > 0]
    pass_msg_part := ["Non-Compliant Resources: None - All passed" | count(nc_resources) == 0]
    remedy_msg_part := [sprintf("Potential Remedies: %s", [remedy_str]) | count(nc_resources) > 0]
    
    # Construct final message array
    msg := array.concat(
        array.concat(
            [header, situation_msg],
            array.concat(nc_msg_part, pass_msg_part)
        ),
        remedy_msg_part
    )
}

details := {}
