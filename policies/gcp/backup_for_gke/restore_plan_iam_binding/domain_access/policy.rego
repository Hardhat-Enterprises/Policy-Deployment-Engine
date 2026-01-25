package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.domain_access
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore operations must be restricted to corporate accounts. Personal emails are potential exfiltration vectors.",
      "remedies": ["Remove members with @gmail.com, @hotmail.com, etc."]
    },
    { "custom_evaluation": true }
  ]
]

get_violations(tf_variables, attribute_path, values) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        member := resource.values.members[_]
        # Check for personal email providers
        bad_domains := ["@gmail.com", "@yahoo.com", "@hotmail.com", "@outlook.com", "@live.com"]
        some domain in bad_domains
        contains(member, domain)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("Restore Plan IAM binding '%s' includes personal account '%s'. Only corporate identities are allowed.", [
                resource.values.name,
                member
            ])
        }
    }
}

message := get_violations(vars.variables, [], [])
details := {}
