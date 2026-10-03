package terraform.helpers.map_key_pattern_whitelist_integration_test

import data.terraform.helpers
import rego.v1

# Runs map key pattern whitelist conditions through the full dispatcher and
# summary, exactly as a policy file would.

variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

plan_for(values) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_compute_instance_template",
	"name": "example-template",
	"values": object.union({"name": "example-template"}, values),
}]}}}

tag_conditions(policy_type, shapes) := [[
	{
		"situation_description": "Resource Manager tags use ambiguous short-name keys instead of permanent tag key IDs",
		"remedies": ["Use permanent tag key IDs (tagKeys/<id>) as resource_manager_tags keys."],
	},
	{
		"condition": "Every resource_manager_tags key uses the permanent-ID form",
		"attribute_path": ["resource_manager_tags"],
		"values": shapes,
		"policy_type": policy_type,
	},
]]

default_conditions := tag_conditions("map key pattern whitelist", ["tagKeys/*"])

# 1. Permanent-ID keys pass.
test_permanent_id_keys_pass if {
	result := helpers.get_multi_summary(default_conditions, variables) with input as plan_for({"resource_manager_tags": {"tagKeys/123": "tagValues/456"}})
	contains(json.marshal(result.message), "None - All passed")
}

# 2. A short-name key is reported without its value.
test_short_name_key_is_reported if {
	result := helpers.get_multi_summary(default_conditions, variables) with input as plan_for({"resource_manager_tags": {"my-org/env": "prod-secret"}})
	out := json.marshal(result)
	not contains(out, "None - All passed")
	contains(out, "my-org/env")
	not contains(out, "prod-secret")
}

# 3. A missing map passes.
test_missing_map_passes if {
	result := helpers.get_multi_summary(default_conditions, variables) with input as plan_for({})
	contains(json.marshal(result.message), "None - All passed")
}

# 4. The type name is case-insensitive.
test_mixed_case_type_name_is_supported if {
	result := helpers.get_multi_summary(tag_conditions("Map Key Pattern Whitelist", ["tagKeys/*"]), variables) with input as plan_for({"resource_manager_tags": {"my-org/env": "prod"}})
	out := json.marshal(result)
	not contains(out, "None - All passed")
	not contains(out, "POLICY ERROR")
}

# 5. An empty shape list is a POLICY ERROR, not a flag-everything policy.
test_empty_shapes_report_policy_error if {
	result := helpers.get_multi_summary(tag_conditions("map key pattern whitelist", []), variables) with input as plan_for({})
	contains(json.marshal(result.message), "POLICY ERROR")
}

# 6. A blank or whitespace-padded shape is a POLICY ERROR.
test_blank_or_padded_shape_reports_policy_error if {
	r1 := helpers.get_multi_summary(tag_conditions("map key pattern whitelist", ["tagKeys/*", ""]), variables) with input as plan_for({})
	contains(json.marshal(r1.message), "POLICY ERROR")
	r2 := helpers.get_multi_summary(tag_conditions("map key pattern whitelist", ["tagKeys/* "]), variables) with input as plan_for({})
	contains(json.marshal(r2.message), "POLICY ERROR")
}

# 7. A path that resolves to a non-map is a POLICY ERROR and hides no value.
test_non_map_path_reports_policy_error if {
	result := helpers.get_multi_summary(default_conditions, variables) with input as plan_for({"resource_manager_tags": ["my-org/env"]})
	out := json.marshal(result.message)
	contains(out, "POLICY ERROR")
	contains(out, "expected a map")
	not contains(out, "my-org/env")
}
