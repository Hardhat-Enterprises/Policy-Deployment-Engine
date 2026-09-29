package terraform.helpers.policies.element_required

# Element Required Policy
#
# Checks that a list attribute contains every value in `values`. A resource is
# non-compliant when, in any element the path reaches, at least one required
# value is missing from the list.
#
# The path is followed through every element of every repeated block, so
# ["disk", "guest_os_features"] checks the features of every disk. A numeric
# index, as in ["disk", 0, "guest_os_features"], checks only that element.
#
# The attribute may be a list, a single value (treated as a one-item list) or
# unset. Unset counts as an empty list, so every required value is missing and
# the element is flagged. When a parent block is not configured there is no
# element to check. Matching is exact, including capitalisation: provider enum
# values such as UEFI_COMPATIBLE must be written exactly as the provider does.

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the list, and the values it must contain.
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, required_values) := results if {
	results := {
	_build_violation(tf_variables, failures, resource) |
		resource := input.planned_values.root_module.resources[_]
		resource.type == tf_variables.resource_type
		failures := _failures(resource, attribute_path, required_values)
		count(failures) > 0
	}
}

# One failure per element whose list is missing at least one required value.
_failures(resource, attribute_path, required_values) := {failure |
	some entry in shared.attribute_entries(resource, attribute_path)
	missing := _missing_values(entry.value, required_values)
	count(missing) > 0
	failure := {"path": entry.path, "missing": missing}
}

# Normalise the attribute to a list: unset is empty, a single value is one item.
_as_list(value) := [] if {
	value == null
}

_as_list(value) := value if {
	is_array(value)
}

_as_list(value) := [value] if {
	value != null
	not is_array(value)
}

# The required values that are not present in the list.
_missing_values(value, required_values) := {required |
	present := {item | some item in _as_list(value)}
	some required in required_values
	not required in present
}

# Build the violation object expected by helpers.get_multi_summary.
_build_violation(tf_variables, failures, resource) := violation if {
	resource_name := shared.get_resource_attribute(
		resource,
		tf_variables.resource_value_name,
	)

	details := sort([sprintf("'%s' is missing %s", [
		shared.format_attribute_path(failure.path),
		concat(", ", sort([sprintf("%v", [item]) | some item in failure.missing])),
	]) |
		some failure in failures
	])

	violation := {
		"name": resource_name,
		"message": sprintf(
			"%s '%s' is missing required value(s): %s",
			[
				tf_variables.friendly_resource_name,
				resource_name,
				concat("; ", details),
			],
		),
	}
}
