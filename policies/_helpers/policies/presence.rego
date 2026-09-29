package terraform.helpers.policies.presence

# Presence Policy
#
# Checks whether an attribute or nested block is set at all, whatever its value.
# `values` is exactly one of:
#   "unset" - the attribute must NOT be set; a resource is non-compliant when it is
#   "set"   - the attribute MUST be set; a resource is non-compliant when it is not
#
# An attribute counts as unset when it is missing, null, "", [] or {}. Terraform
# writes an absent nested block as [] in the plan, so "unset" on a block path
# (for example ["network_interface", 0, "access_config"]) detects whether the
# block was configured. false and 0 are real values, so they count as set.
#
# Combine a "unset" condition on an optional block with another condition in a
# "match": "all" situation to write "when this block exists, X must hold".

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the attribute, and ["set"] or ["unset"].
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, values) := results if {
	mode := _mode(values)
	results := {
	_build_violation(tf_variables, attribute_path, mode, resource) |
		resource := input.planned_values.root_module.resources[_]
		resource.type == tf_variables.resource_type
		_violates(resource, attribute_path, mode)
	}
}

# The configured mode, lowercased. Undefined for anything else, which the
# dispatcher preflight reports as a POLICY ERROR before evaluation.
_mode(values) := mode if {
	count(values) == 1
	is_string(values[0])
	mode := lower(values[0])
	mode in {"set", "unset"}
}

_violates(resource, attribute_path, "unset") if {
	_is_set(shared.get_attribute_value(resource, attribute_path))
}

_violates(resource, attribute_path, "set") if {
	not _is_set(shared.get_attribute_value(resource, attribute_path))
}

# A value is set unless it is null, an empty string, an empty list or an empty object.
_is_set(value) if {
	value != null
	value != ""
	value != []
	value != {}
}

# Build the violation object expected by helpers.get_multi_summary. The message
# never includes the attribute's value.
_build_violation(tf_variables, attribute_path, mode, resource) := violation if {
	resource_name := shared.get_resource_attribute(
		resource,
		tf_variables.resource_value_name,
	)

	violation := {
		"name": resource_name,
		"message": sprintf(
			"%s '%s' %s",
			[
				tf_variables.friendly_resource_name,
				resource_name,
				_describe(mode, shared.format_attribute_path(attribute_path)),
			],
		),
	}
}

_describe("unset", path) := sprintf("has '%s' set, but it must not be set", [path])

_describe("set", path) := sprintf("does not set '%s', but it must be set", [path])
