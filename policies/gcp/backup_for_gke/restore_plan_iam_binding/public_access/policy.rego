package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.public_access
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan IAM must strictly prohibit public access to prevent unauthorized data restoration.",
      "remedies": ["Remove 'allUsers' and 'allAuthenticatedUsers' from IAM bindings."]
    },
    { "custom_evaluation": true }
  ]
]

get_violations(tf_variables, attribute_path, values) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        member := resource.values.members[_]
        public_principals := {"allUsers", "allAuthenticatedUsers"}
        public_principals[member]
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("Restore Plan IAM binding '%s' grants access to '%s'. Public access is strictly forbidden for backup restoration.", [
                resource.values.name,
                member
            ])
        }
    }
}

message := get_violations(vars.variables, [], [])
details := {}
