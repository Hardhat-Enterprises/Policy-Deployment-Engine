package terraform.helpers
# Tested on OPA Version: 1.2.0, Rego Version: v1

# Policy Orchestration Layer
# 
# This module serves as the main entry point for all policy evaluation.
# It coordinates policy execution across multiple situations and conditions,
# aggregating results and formatting them for consumption.
#
# Architecture:
#   - Delegates policy logic to specialized modules (blacklist, whitelist, range, etc.)
#   - Uses set intersection for AND logic across conditions
#   - Returns structured summaries with violation details

import data.terraform.helpers.shared
import data.terraform.helpers.org_config
import data.terraform.helpers.policies.blacklist
import data.terraform.helpers.policies.whitelist
import data.terraform.helpers.policies.range
import data.terraform.helpers.policies.pattern_blacklist
import data.terraform.helpers.policies.pattern_whitelist
import data.terraform.helpers.policies.element_blacklist

################################################################################
# Public API
################################################################################

# Main entry point for policy evaluation
#
# Evaluates a set of policy conditions against Terraform plan resources and
# returns a structured summary of compliant and non-compliant resources.
#
# Parameters:
#   conditions - Array of condition groups, each containing:
#                - situation_description: Human-readable scenario name
#                - remedies: Array of suggested fixes
#                - condition objects with policy_type, attribute_path, values
#   tf_variables - Resource configuration containing:
#                  - resource_type: Terraform resource type (e.g., "google_storage_bucket")
#                  - friendly_resource_name: Display name for messages
#                  - value_name: Attribute key for resource identification
#
# Returns:
#   Object with:
#     - message: Array of formatted summary strings
#     - details: Array of situation results with non_compliant_resources
#
# Logic:
#   Resources must fail ALL conditions within a situation to be non-compliant (AND logic)
get_multi_summary(conditions, tf_variables) = summary if {
    # Count resources without storing them
    resource_count := count([r |
        r := input.planned_values.root_module.resources[_]
        r.type == tf_variables.resource_type
    ])
    
    # Build situation results using declarative approach
    situation_results := build_situation_results(tf_variables, conditions)
    
    summary := {
        "message": format_summary_messages(
            tf_variables.friendly_resource_name,
            resource_count,
            situation_results
        ),
        "details": situation_results
    }
} else := "Policy type not supported."

################################################################################
# Situation Processing
################################################################################

# Build all situation results in one pass
build_situation_results(tf_variables, conditions) = results if {
    results := [
        build_single_situation(tf_variables, condition_group) |
        some condition_group in conditions
    ]
}

# Process a single situation (metadata + conditions)
build_single_situation(tf_variables, condition_group) = situation_result if {
    # Extract metadata
    metadata := extract_situation_metadata(condition_group)
    
    # Evaluate all conditions for this situation
    condition_results := evaluate_conditions(tf_variables, condition_group)
    
    # Find resources that fail ALL conditions (AND logic)
    nc_resources := find_failing_resources(condition_results)
    
    situation_result := {
        "situation": metadata.description,
        "remedies": metadata.remedies,
        "non_compliant_resources": nc_resources,
        "conditions": condition_results
    }
}

# Extract metadata from condition group
extract_situation_metadata(condition_group) = metadata if {
    # Find metadata entry
    description := shared.get_value_from_array(condition_group, "situation_description")
    remedies := shared.get_value_from_array(condition_group, "remedies")
    
    metadata := {
        "description": description,
        "remedies": remedies
    }
}

################################################################################
# Condition Evaluation
################################################################################

# Evaluate all conditions, returning structured results
evaluate_conditions(tf_variables, condition_group) = results if {
    results := [
        {condition_obj.condition: violations} |
        some condition_entry in condition_group
        condition_obj := condition_entry
        condition_obj.policy_type  # Skip metadata entries without policy_type
        
        # Get violations for this condition
        values := shared.ensure_array(condition_obj.values)
        policy_type := lower(condition_obj.policy_type)
        resolved_values := org_config.resolve_condition_values(
            condition_obj.attribute_path,
            values,
            policy_type
        )
        violations := select_policy_logic(
            tf_variables,
            condition_obj.attribute_path,
            resolved_values,
            policy_type
        )
    ]
}

# Find resources failing ALL conditions using set intersection
find_failing_resources(condition_results) = failing_resources if {
    # Extract resource names from each condition into sets
    resource_sets := [
        {resource.name |
            some _, violations in condition_results[_]
            some resource in violations
        }
    ]
    
    # Apply intersection across all sets
    count(resource_sets) > 0
    failing_resources := set_intersection_all(resource_sets)
} else = set()

################################################################################
# Policy Type Dispatch
################################################################################
# Routes evaluation to appropriate policy module based on policy_type string
# Each policy type implements its own violation detection logic

select_policy_logic(tf_variables, attribute_path, values_formatted, "blacklist") = results if {
    results := blacklist.get_violations(tf_variables, attribute_path, values_formatted)
}

select_policy_logic(tf_variables, attribute_path, values_formatted, "whitelist") = results if {
    results := whitelist.get_violations(tf_variables, attribute_path, values_formatted)
}

select_policy_logic(tf_variables, attribute_path, values_formatted, "range") = results if {
    results := range.get_violations(tf_variables, attribute_path, values_formatted)
}

select_policy_logic(tf_variables, attribute_path, values_formatted, "pattern blacklist") = results if {
    results := pattern_blacklist.get_violations(tf_variables, attribute_path, values_formatted)
}

select_policy_logic(tf_variables, attribute_path, values_formatted, "pattern whitelist") = results if {
    results := pattern_whitelist.get_violations(tf_variables, attribute_path, values_formatted)
}

select_policy_logic(tf_variables, attribute_path, values_formatted, "element blacklist") = results if {
    results := element_blacklist.get_violations(tf_variables, attribute_path, values_formatted)
}

# Fallback for unknown policy types
select_policy_logic(_, _, _, policy_type) = results if {
    not policy_type in ["blacklist", "whitelist", "range", "pattern blacklist", "pattern whitelist", "element blacklist"]
    results := {
        {"error": sprintf("Unknown policy type: '%s'. Valid types: blacklist, whitelist, range, pattern blacklist, pattern whitelist, element blacklist", [policy_type])}
    }
}

################################################################################
# Output Formatting
################################################################################

# Format messages using array comprehension
format_summary_messages(resource_name, total_count, situations) = messages if {
    header := sprintf("Total %s detected: %d ", [resource_name, total_count])
    
    situation_messages := [msg |
        some i
        sit := situations[i]
        
        # Convert set to array for formatting
        nc_list := [r | some r in sit.non_compliant_resources]
        
        # Handle empty case: display "All passed" if no violations
        display_list := _get_display_list(nc_list)
        
        msg := array.concat(
            [
                sprintf("Situation %d: %s", [i+1, sit.situation]),
                sprintf("Non-Compliant Resources: %s", [concat(", ", display_list)])
            ],
            [sprintf("Potential Remedies: %s", [concat(", ", sit.remedies)]) | count(nc_list) > 0]
        )
    ]
    
    messages := array.concat([header], situation_messages)
}

# Helper to format non-compliant resources list
_get_display_list(nc_list) = ["None - All passed"] if {
    count(nc_list) == 0
}
_get_display_list(nc_list) = nc_list if {
    count(nc_list) > 0
}

################################################################################
# Set Utilities
################################################################################

# Improved set intersection using native Rego idioms
set_intersection_all(sets) = result if {
    count(sets) == 0
    result := set()
} else = result if {
    count(sets) == 1
    result := sets[0]
} else = result if {
    # Find intersection of all sets using 'every' keyword
    first_set := sets[0]
    # Set comprehension: for each resource in first_set, include it in result
    # only if it exists in every remaining set (intersection logic)
    result := {resource |
        some resource in first_set
        every remaining_set in sets {
            resource in remaining_set
        }
    }
}