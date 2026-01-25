package terraform.gcp.security.backup_for_gke.restore_plan.excluded_namespaces
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Critical system namespaces must not be excluded from restoration to ensure cluster integrity.",
      "remedies": ["Remove 'kube-system' and 'gatekeeper-system' from excluded_namespaces."]
    },
    {
       # Custom logic instead of element_blacklist helper to ensure correct path handling
       "condition": "Excluded namespaces must not contain system critical namespaces",
       "custom_evaluation": true 
    }
  ]
]

# Custom validation rule
get_violations(tf_variables, attribute_path, values) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        # Robust path traversal
        rc := resource.values.restore_config[_]
        en := rc.excluded_namespaces[_]
        forbidden := {"kube-system", "gatekeeper-system"}
        
        # Check intersection
        violation_ns := en.namespaces[_]
        forbidden[violation_ns]
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("%s '%s' excludes critical system namespace '%s'. System namespaces must be restored.", [
                tf_variables.friendly_resource_name,
                resource.values.name,
                violation_ns
            ])
        }
    }
}

message := get_violations(vars.variables, [], [])
details := {}
