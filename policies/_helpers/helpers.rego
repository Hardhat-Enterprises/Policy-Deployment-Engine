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
#   - Unions the violations of every condition in a situation (OR, not AND)
#   - Returns structured summaries with violation details

import data.terraform.helpers.shared
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
#   Within a situation, a resource is non-compliant if it fails ANY condition (OR
#   logic). Each condition's violations are unioned, not intersected. See the long
#   note on find_failing_resources for why that is the semantics we want.
get_multi_summary(conditions, tf_variables) = summary if {
    # An unrecognised policy_type is a BROKEN policy, not a permissive one. This
    # branch runs before any evaluation so it cannot be swallowed: select_policy_logic
    # is only reached from a comprehension, and a comprehension silently DROPS an
    # iteration whose body is undefined, which is how an unknown type used to make a
    # policy pass everything in silence. Refuse the whole summary instead.
    problems := policy_type_problems(conditions)
    count(problems) > 0
    summary := {
        "message": [policy_type_error_message(problems)],
        "details": []
    }
} else = summary if {
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
    
    # Every resource flagged by ANY of this situation's conditions (OR logic)
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
        violations := select_policy_logic(
            tf_variables,
            condition_obj.attribute_path,
            values,
            policy_type
        )
    ]
}

# Collect every resource flagged by ANY condition in this situation (OR logic).
#
# This is a UNION, and that is deliberate. Read the shape before "fixing" it: the
# outer `[...]` is an array LITERAL wrapping ONE set comprehension, not a
# comprehension over conditions. That single comprehension walks every condition
# result (`condition_results[_]`) and every violation inside it, so the one set it
# builds already holds the union of all conditions' violations. `resource_sets`
# therefore always has exactly one element, `set_intersection_all` takes its
# `count(sets) == 1` branch, and the set comes back unchanged.
#
# WHY union is the behaviour we want. A situation groups the several ways one
# argument can be wrong, and each condition is one of those ways. Flagging on ANY
# of them OVER-flags: a resource that trips one check gets reported even though
# another check passed. Real AND would UNDER-flag: a resource that trips one check
# and passes another would be reported compliant, and the policy would quietly
# stop catching the thing it was written to catch. An over-flag is visible in a
# test run and gets fixed; an under-flag is silent and can sit there for a
# trimester. The tutorial already assumes OR — "check the shape with a whitelist
# (or a pattern blacklist on the bad shape) as a second condition" only adds
# coverage if a second condition can flag on its own.
#
# Verified 2026-08-31 by probe: two whitelist conditions in one situation, on
# `labels.owner` and `labels.cost-center`, against a resource whose `owner` is
# correct and whose `cost-center` is wrong. It IS flagged. Under AND it would not
# be.
#
# These comments used to read "fail ALL conditions (AND logic)". The comments were
# wrong, not the code. Do not change the code to match an old comment.
find_failing_resources(condition_results) = failing_resources if {
    # ONE set, holding the names from every condition's violations.
    resource_sets := [
        {resource.name |
            some _, violations in condition_results[_]
            some resource in violations
        }
    ]
    
    # With exactly one set this is always true and set_intersection_all's
    # count(sets) == 1 branch hands that set straight back — so the `else = set()`
    # fallback below is unreachable today. Kept: it is the correct answer if a
    # future change ever makes resource_sets undefined.
    count(resource_sets) > 0
    failing_resources := set_intersection_all(resource_sets)
} else = set()

################################################################################
# Policy Type Dispatch
################################################################################
# Routes evaluation to appropriate policy module based on policy_type string
# Each policy type implements its own violation detection logic

# The complete set of policy_type values select_policy_logic can dispatch. Every
# entry here must have a matching select_policy_logic rule below, and vice versa:
# this list is what get_multi_summary validates against and what the error message
# offers the author. Keep it in step with policies/_helpers/policies/.
valid_policy_types := [
    "blacklist",
    "whitelist",
    "range",
    "pattern blacklist",
    "pattern whitelist",
    "element blacklist",
]

# Every reason `conditions` cannot be dispatched, as human-readable phrases. Two
# kinds, because evaluate_conditions drops both in the same silent way:
#   - a policy_type dispatch does not know;
#   - a condition with no policy_type at all (line "condition_obj.policy_type"
#     there skips it, which is right for the situation_description/remedies
#     entries and wrong for a real check that simply forgot the key).
policy_type_problems(conditions) := problems if {
    problems := _unknown_type_problems(conditions) | _missing_type_problems(conditions)
}

# Normalised the same way evaluate_conditions normalises it (lowercased), so
# "Whitelist" and "whitelist" are one type. A non-string policy_type is reported
# verbatim rather than dropped — lower() is undefined for it, which would
# otherwise make it invisible here and silently unevaluated there.
_unknown_type_problems(conditions) := problems if {
    problems := {sprintf("unknown policy_type '%s'", [t]) |
        some condition_group in conditions
        some condition_entry in condition_group
        raw := condition_entry.policy_type
        t := _normalise_policy_type(raw)
        not t in valid_policy_types
    }
}

# A condition is anything carrying an attribute_path; the metadata entries carry
# situation_description/remedies instead and are meant to have no policy_type.
_missing_type_problems(conditions) := problems if {
    problems := {sprintf("no policy_type on the condition reading '%s'",
                         [shared.format_attribute_path(condition_entry.attribute_path)]) |
        some condition_group in conditions
        some condition_entry in condition_group
        condition_entry.attribute_path
        not "policy_type" in object.keys(condition_entry)
    }
}

_normalise_policy_type(raw) := lower(raw) if {
    is_string(raw)
}

_normalise_policy_type(raw) := sprintf("%v", [raw]) if {
    not is_string(raw)
}

# The message the author sees. It names what they wrote, what the valid values
# are, and what to do about it — a bare "unsupported" tells a student nothing.
# auto_test.py keys off the "POLICY ERROR:" prefix to fail the check with this
# text as the reason (see find_policy_error there).
policy_type_error_message(problems) := msg if {
    named := concat("; ", sort(problems))
    msg := sprintf(
        concat("", [
            "POLICY ERROR: %s. ",
            "Nothing in this policy was checked. ",
            "Valid values are: %s. ",
            "Edit the \"policy_type\" in this policy's conditions to one of those ",
            "- they are lowercase and use a SPACE, not an underscore ",
            "(\"pattern whitelist\", not \"pattern_whitelist\") - then run the test again.",
        ]),
        [named, concat(", ", valid_policy_types)]
    )
}

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

# There is deliberately NO fallback rule for an unknown policy_type. One used to
# exist and returned {"error": ...} — an object with no "name" key, which
# find_failing_resources then intersected into the empty set, so the policy passed
# everything and the diagnosis was thrown away. The type is validated up front in
# get_multi_summary instead, where the error can actually reach the surface.

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

# Intersection over a list of sets. The function is correct as written, but note
# that its only caller, find_failing_resources, always hands it exactly ONE set —
# so in practice the count(sets) == 1 branch is the branch that runs, and the
# engine's cross-condition semantics is union. The multi-set branch below is
# currently unexercised by any policy.
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