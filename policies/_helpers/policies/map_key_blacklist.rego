package terraform.helpers.policies.map_key_blacklist

# Map Key Blacklist Policy
#
# Checks the keys inside a Terraform map. A resource is non-compliant when:
#   1. a map key matches one of the blacklisted keys, ignoring capitalisation; and
#   2. the value stored against that key is not null or empty.
#
# The helper reports only the matching key names. It never includes the map
# values in its message because those values may contain credentials.

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the map, and prohibited key names.
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, blacklisted_keys) := results if {
	non_compliant_resources := _get_resources(
		tf_variables.resource_type,
		attribute_path,
		blacklisted_keys,
	)

	results := {
	_build_violation(
		tf_variables,
		attribute_path,
		blacklisted_keys,
		resource,
	) |
		some resource in non_compliant_resources
	}
}

# Find resources containing a blacklisted map key with a non-empty value.
_get_resources(resource_type, attribute_path, blacklisted_keys) := resources if {
	resources := {
	resource |
		resource := input.planned_values.root_module.resources[_]
		resource.type == resource_type

		map_value := shared.get_attribute_value(resource, attribute_path)
		is_object(map_value)

		some map_key, map_value_entry in map_value
		_key_is_blacklisted(map_key, blacklisted_keys)
		_value_is_not_empty(map_value_entry)
	}
}

# Compare keys without caring about uppercase or lowercase letters.
_key_is_blacklisted(map_key, blacklisted_keys) if {
	is_string(map_key)

	some blacklisted_key in blacklisted_keys
	is_string(blacklisted_key)

	lower(map_key) == lower(blacklisted_key)
}

# Empty map values do not contain an inline credential.
_value_is_not_empty(map_value_entry) if {
	map_value_entry != null
	map_value_entry != ""
}

# Collect the blacklisted key names found on one resource.
_get_matching_keys(resource, attribute_path, blacklisted_keys) := matching_keys if {
	map_value := shared.get_attribute_value(resource, attribute_path)

	matching_keys := sort([
	map_key |
		some map_key, map_value_entry in map_value
		_key_is_blacklisted(map_key, blacklisted_keys)
		_value_is_not_empty(map_value_entry)
	])
}

# Build the violation object expected by helpers.get_multi_summary.
_build_violation(tf_variables, attribute_path, blacklisted_keys, resource) := violation if {
	resource_name := shared.get_resource_attribute(
		resource,
		tf_variables.resource_value_name,
	)

	matching_keys := _get_matching_keys(
		resource,
		attribute_path,
		blacklisted_keys,
	)

	violation := {
		"name": resource_name,
		"message": sprintf(
			"%s '%s' contains sensitive inline map key(s): %s",
			[
				tf_variables.friendly_resource_name,
				resource_name,
				concat(", ", matching_keys),
			],
		),
	}
}
