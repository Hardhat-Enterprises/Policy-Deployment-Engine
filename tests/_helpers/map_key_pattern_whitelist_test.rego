package terraform.helpers.policies.map_key_pattern_whitelist_test

import data.terraform.helpers.policies.map_key_pattern_whitelist
import rego.v1

# These values describe the Terraform resource used by the mock plans below.
mock_variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

tags_path := ["resource_manager_tags"]

allowed_shapes := ["tagKeys/*"]

# Small builders keep each test focused on the behaviour being checked.
make_plan(resources) := {
	"planned_values": {
		"root_module": {
			"resources": resources,
		},
	},
}

make_template(name, tags) := {
	"type": "google_compute_instance_template",
	"name": name,
	"values": {
		"name": name,
		"resource_manager_tags": tags,
	},
}

make_template_without_tags(name) := {
	"type": "google_compute_instance_template",
	"name": name,
	"values": {"name": name},
}

violations_for(resources, shapes) := violations if {
	violations := map_key_pattern_whitelist.get_violations(
		mock_variables,
		tags_path,
		shapes,
	) with input as make_plan(resources)
}

# 1. Keys in the permanent-ID form are compliant.
test_permanent_id_keys_are_compliant if {
	tags := {"tagKeys/281474976710656": "tagValues/123", "tagKeys/99": "tagValues/7"}
	count(violations_for([make_template("ok-template", tags)], allowed_shapes)) == 0
}

# 2. A short-name key is flagged and named in the message.
test_short_name_key_is_flagged if {
	tags := {"tagKeys/281474976710656": "tagValues/123", "my-org/env": "prod"}
	violations := violations_for([make_template("bad-template", tags)], allowed_shapes)
	count(violations) == 1
	some v in violations
	v.name == "bad-template"
	contains(v.message, "my-org/env")
	not contains(v.message, "tagKeys/281474976710656")
}

# 3. Map values are never included in the message.
test_values_are_not_reported if {
	violations := violations_for([make_template("t", {"my-org/env": "secret-value"})], allowed_shapes)
	some v in violations
	not contains(v.message, "secret-value")
}

# 4. Matching ignores capitalisation.
test_matching_ignores_case if {
	count(violations_for([make_template("t", {"TAGKEYS/123": "v"})], allowed_shapes)) == 0
}

# 5. '*' matches a single segment, so an extra '/' is not allowed.
test_wildcard_does_not_span_segments if {
	count(violations_for([make_template("t", {"tagKeys/123/extra": "v"})], allowed_shapes)) == 1
}

# 6. A key matching any one of several shapes is allowed.
test_any_shape_allows_the_key if {
	shapes := ["tagKeys/*", "env"]
	count(violations_for([make_template("t", {"env": "prod", "tagKeys/1": "v"})], shapes)) == 0
}

# 7. A missing map produces no violations.
test_missing_map_is_allowed if {
	count(violations_for([make_template_without_tags("t")], allowed_shapes)) == 0
}

# 8. An empty map produces no violations.
test_empty_map_is_allowed if {
	count(violations_for([make_template("t", {})], allowed_shapes)) == 0
}

# 9. A key with an empty value is still checked.
test_empty_value_key_is_still_checked if {
	count(violations_for([make_template("t", {"my-org/env": ""})], allowed_shapes)) == 1
}

# 10. Regex metacharacters in a shape are matched literally.
test_dots_are_literal if {
	shapes := ["team.*"]
	count(violations_for([make_template("t", {"teamXprod": "v"})], shapes)) == 1
	count(violations_for([make_template("t", {"team.prod": "v"})], shapes)) == 0
}

# 11. Resources of another type are ignored.
test_other_resource_types_are_ignored if {
	other := object.union(make_template("other", {"my-org/env": "prod"}), {"type": "google_compute_instance"})
	count(violations_for([other], allowed_shapes)) == 0
}

# 12. Several bad keys are listed in sorted order.
test_bad_keys_are_sorted if {
	violations := violations_for([make_template("t", {"z-org/b": "1", "a-org/a": "2"})], allowed_shapes)
	some v in violations
	contains(v.message, "a-org/a, z-org/b")
}
