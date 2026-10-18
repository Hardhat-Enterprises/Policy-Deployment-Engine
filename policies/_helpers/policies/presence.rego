package terraform.helpers.policies.presence

# Presence Policy
#
# Checks whether an attribute or nested block is set at all, whatever its value.
# `values` is exactly one of:
#   "unset" - the attribute must NOT be set; an element is non-compliant when it is
#   "set"   - the attribute MUST be set; an element is non-compliant when it is not
#
# The path is followed through every element of every repeated block, so
# ["network_interface", "access_config"] checks every network interface. A
# numeric index, as in ["network_interface", 0, "access_config"], checks only
# that element. When a parent block is not configured there is no element to
# check, so ["service_account", "email"] with "set" only applies to templates
# that configure a service_account block.
#
# An attribute counts as unset when it is missing, null, "", [] or {}. Terraform
# writes an absent nested block as [], so "unset" on a block path detects
# whether the block was configured. false and 0 are real values, so they count
# as set.
#
# The same checks can be written as whitelist [null, "", [], {}] ("unset") and
# blacklist [null, "", [], {}] ("set") on a single element. This type exists
# because it checks every element and is harder to get wrong.

import data.terraform.helpers.shared

# Main function called by the PDE helper dispatcher.
# Parameters: resource metadata, path to the attribute, and ["set"] or ["unset"].
# Returns: a set of violation objects with the standard {name, message} fields.
get_violations(tf_variables, attribute_path, values) := results if {
	mode := _mode(values)
	results := {
	_build_violation(tf_variables, mode, paths, resource) |
		resource := input.planned_values.root_module.resources[_]
		resource.type == tf_variables.resource_type
		paths := {entry.path |
			some entry in shared.attribute_entries(resource, attribute_path)
			_violates(entry.value, mode)
		}
		count(paths) > 0
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

_violates(value, "unset") if _is_set(value)

_violates(value, "set") if not _is_set(value)

# A value is set unless it is null, an empty string, an empty list or an empty object.
_is_set(value) if {
	value != null
	value != ""
	value != []
	value != {}
}

# Build the violation object expected by helpers.get_multi_summary. The message
# names the paths, never the attribute's value.
_build_violation(tf_variables, mode, paths, resource) := violation if {
	resource_name := shared.get_resource_attribute(
		resource,
		tf_variables.resource_value_name,
	)

	formatted := sort([sprintf("'%s'", [shared.format_attribute_path(path)]) | some path in paths])

	violation := {
		"name": resource_name,
		"message": sprintf(
			"%s '%s' %s",
			[
				tf_variables.friendly_resource_name,
				resource_name,
				_describe(mode, concat(", ", formatted)),
			],
		),
	}
}

_describe("unset", paths) := sprintf("sets %s, which must not be set", [paths])

_describe("set", paths) := sprintf("does not set %s, which must be set", [paths])
