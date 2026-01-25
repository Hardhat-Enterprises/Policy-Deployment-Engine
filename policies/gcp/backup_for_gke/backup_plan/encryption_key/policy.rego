package terraform.gcp.security.backup_for_gke.backup_plan.encryption_key
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan encryption key must be in australia-southeast1.",
      "remedies": ["Use an encryption key from australia-southeast1."]
    },
    {
      "condition": "Encryption key must be a valid GCP KMS resource ID in australia-southeast1.",
      "attribute_path": ["backup_config", 0, "encryption_key", 0, "gcp_kms_encryption_key"],
      "values": ["^projects/[a-zA-Z0-9-]+/locations/australia-southeast1/keyRings/[a-zA-Z0-9-]+/cryptoKeys/[a-zA-Z0-9-]+$"],
      "policy_type": "pattern_whitelist" 
    },
    { "custom_evaluation": true }
  ]
]

# Custom fallback for pattern matching (since helper regex support is limited)
get_violations(tf_variables, attribute_path, values) = results if {
    results := { violation |
        resource := input.planned_values.root_module.resources[_]
        resource.type == tf_variables.resource_type
        
        # Safe traversal
        bc := resource.values.backup_config[_]
        ek := bc.encryption_key[_]
        key_id := ek.gcp_kms_encryption_key
        
        # Regex check
        pattern := values[0]
        not regex.match(pattern, key_id)
        
        violation := {
            "name": resource.values.name,
            "message": sprintf("Encryption Key '%s' format invalid or wrong region. Must match: %s", [key_id, pattern])
        }
    }
}

# Manually constructing message using local get_violations
message := msg if {
    # 1. Detect resources
    resources := [r | r := input.planned_values.root_module.resources[_]; r.type == vars.variables.resource_type]
    
    # 2. Evaluate
    # Use existing conditions definition for metadata, but call local get_violations
    condition := conditions[0][0] # Metadata
    pattern := conditions[0][1].values[0] # Regex pattern
    
    # Call local get_violations with pattern
    violations := get_violations(vars.variables, [], [pattern])
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
