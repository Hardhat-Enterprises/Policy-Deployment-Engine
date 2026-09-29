package terraform.helpers.policies.map_key_pattern_whitelist

# Map Key Pattern Whitelist Policy
#
# Checks the keys inside a Terraform map. A resource is non-compliant when at
# least one map key does not match any of the allowed wildcard shapes in
# `values`, ignoring capitalisation.
#
# Each '*' matches one or more non-'/' characters (a single path segment), and
# every other character is matched literally, the same way as
# element pattern whitelist. For example "tagKeys/*" allows
# "tagKeys/281474976710656" but not "my-org/env".
#
# A missing or null map, or an empty map, produces no violations: there are no
# keys to check. Every key is checked whatever its value. The helper reports
# only the offending key names, never the map values.

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the map, and the allowed key shapes.
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, allowed_patterns) := results if {
	non_compliant_resources := _get_resources(
		tf_variables.resource_type,
		attribute_path,
		allowed_patterns,
	)

	results := {
	_build_violation(
		tf_variables,
		attribute_path,
		allowed_patterns,
		resource,
	) |
		some resource in non_compliant_resources
	}
}

# Find resources whose map has at least one key outside the allowed shapes.
_get_resources(resource_type, attribute_path, allowed_patterns) := resources if {
	resources := {
	resource |
		resource := input.planned_values.root_module.resources[_]
		resource.type == resource_type
		count(_bad_keys(resource, attribute_path, allowed_patterns)) > 0
	}
}

# The map keys that match none of the allowed shapes.
_bad_keys(resource, attribute_path, allowed_patterns) := bad if {
	map_value := shared.get_attribute_value(resource, attribute_path)
	is_object(map_value)
	bad := {map_key |
		some map_key, _ in map_value
		not _key_is_allowed(map_key, allowed_patterns)
	}
}

# A key is allowed when it matches any shape, ignoring capitalisation.
_key_is_allowed(map_key, allowed_patterns) if {
	is_string(map_key)
	some pattern in allowed_patterns
	is_string(pattern)
	_matches(lower(pattern), lower(map_key))
}

# '*' becomes one or more non-'/' characters; everything else is literal.
_matches(pattern, value) if {
	parts := split(pattern, "*")
	escaped := [_escape(part) | part := parts[_]]
	p := concat("[^/]+", escaped)
	regex.match(sprintf("^%s$", [p]), value)
}

# Escapes regex metacharacters in a pattern segment so the rest matches literally.
_escape(segment) := regex.replace(segment, "([.+?()\\[\\]{}\\^$|\\\\])", "\\$1")

# Build the violation object expected by helpers.get_multi_summary.
_build_violation(tf_variables, attribute_path, allowed_patterns, resource) := violation if {
	resource_name := shared.get_resource_attribute(
		resource,
		tf_variables.resource_value_name,
	)

	bad := sort([sprintf("%v", [map_key]) |
		some map_key in _bad_keys(resource, attribute_path, allowed_patterns)
	])

	violation := {
		"name": resource_name,
		"message": sprintf(
			"%s '%s' has map key(s) in '%s' not matching any allowed shape %v: %s",
			[
				tf_variables.friendly_resource_name,
				resource_name,
				shared.format_attribute_path(attribute_path),
				allowed_patterns,
				concat(", ", bad),
			],
		),
	}
}
