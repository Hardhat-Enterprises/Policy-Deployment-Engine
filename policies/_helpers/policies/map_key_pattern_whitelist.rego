package terraform.helpers.policies.map_key_pattern_whitelist

# Map Key Pattern Whitelist Policy
#
# Checks the keys inside a Terraform map. A resource is non-compliant when, in
# any element the path reaches, at least one map key does not match any of the
# allowed wildcard shapes in `values`, ignoring capitalisation.
#
# Shapes are matched by shared.wildcard_match, the same matcher as
# element pattern whitelist: each '*' matches one or more non-'/' characters
# and every other character is literal. For example "tagKeys/*" allows
# "tagKeys/281474976710656" but not "my-org/env".
#
# The path is followed through every element of every repeated block; a
# numeric index checks only that element. A missing or null map, or an empty
# map, produces no violations. Every key is checked whatever its value. The
# helper reports only the offending key names, never the map values.

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the map, and the allowed key shapes.
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, allowed_patterns) := results if {
	results := {
	_build_violation(tf_variables, allowed_patterns, failures, resource) |
		resource := input.planned_values.root_module.resources[_]
		resource.type == tf_variables.resource_type
		failures := _failures(resource, attribute_path, allowed_patterns)
		count(failures) > 0
	}
}

# One failure per map that has at least one key outside the allowed shapes.
_failures(resource, attribute_path, allowed_patterns) := {failure |
	some entry in shared.attribute_entries(resource, attribute_path)
	is_object(entry.value)
	bad := {map_key |
		some map_key, _ in entry.value
		not _key_is_allowed(map_key, allowed_patterns)
	}
	count(bad) > 0
	failure := {"path": entry.path, "keys": bad}
}

# A key is allowed when it matches any shape, ignoring capitalisation.
_key_is_allowed(map_key, allowed_patterns) if {
	is_string(map_key)
	some pattern in allowed_patterns
	is_string(pattern)
	shared.wildcard_match(lower(pattern), lower(map_key))
}

# Build the violation object expected by helpers.get_multi_summary.
_build_violation(tf_variables, allowed_patterns, failures, resource) := violation if {
	resource_name := shared.get_resource_attribute(
		resource,
		tf_variables.resource_value_name,
	)

	details := sort([sprintf("'%s' has %s", [
		shared.format_attribute_path(failure.path),
		concat(", ", sort([sprintf("%v", [k]) | some k in failure.keys])),
	]) |
		some failure in failures
	])

	violation := {
		"name": resource_name,
		"message": sprintf(
			"%s '%s' has map key(s) not matching any allowed shape %v: %s",
			[
				tf_variables.friendly_resource_name,
				resource_name,
				allowed_patterns,
				concat("; ", details),
			],
		),
	}
}
