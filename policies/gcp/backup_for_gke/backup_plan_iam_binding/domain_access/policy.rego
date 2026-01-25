package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.domain_access
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  {
    "situation_description": "Backup Plan IAM members must not be personal email accounts.",
    "remedies": ["Remove members with personal email domains (@gmail.com, etc)."]
  }
]

get_violations(tf_variables, condition) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        # Iterate over members (handles both Set and Array)
        member := resource.values.members[_]
        
        # Check for personal email providers
        bad_domains := ["@gmail.com", "@hotmail.com", "@yahoo.com", "@outlook.com"]
        some domain in bad_domains
        contains(member, domain)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("IAM binding '%s' includes personal account '%s'. Only corporate identities are allowed.", [
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
    
    # Conditional parts
    nc_msg_part := [sprintf("Non-Compliant Resources: %s", [nc_list_str]) | count(nc_resources) > 0]
    pass_msg_part := ["Non-Compliant Resources: None - All passed" | count(nc_resources) == 0]
    
    # Detailed violation messages
    det_msg_part := [v.message | v := violations[_]]
    
    remedy_msg_part := [sprintf("Potential Remedies: %s", [remedy_str]) | count(nc_resources) > 0]
    
    # Construct final message array
    msg := array.concat(
        array.concat(
            array.concat([header, situation_msg], nc_msg_part),
            pass_msg_part
        ),
        array.concat(det_msg_part, remedy_msg_part)
    )
}

details := {}
