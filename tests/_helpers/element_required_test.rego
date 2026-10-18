package terraform.helpers.policies.element_required_test

import data.terraform.helpers.policies.element_required
import rego.v1

# These values describe the Terraform resource used by the mock plans below.
mock_variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

features_path := ["disk", 0, "guest_os_features"]

required_features := ["UEFI_COMPATIBLE", "SEV_CAPABLE"]

# Small builders keep each test focused on the behaviour being checked.
make_plan(resources) := {
	"planned_values": {
		"root_module": {
			"resources": resources,
		},
	},
}

make_template(name, features) := {
	"type": "google_compute_instance_template",
	"name": name,
	"values": {
		"name": name,
		"disk": [{
			"source_image": "debian-cloud/debian-11",
			"guest_os_features": features,
		}],
	},
}

make_template_without_features(name) := {
	"type": "google_compute_instance_template",
	"name": name,
	"values": {
		"name": name,
		"disk": [{
			"source_image": "debian-cloud/debian-11",
		}],
	},
}

violations_for(resources) := violations if {
	violations := element_required.get_violations(
		mock_variables,
		features_path,
		required_features,
	) with input as make_plan(resources)
}

# 1. Every required value present is compliant.
test_all_required_present_is_compliant if {
	count(violations_for([make_template("ok-template", ["UEFI_COMPATIBLE", "SEV_CAPABLE"])])) == 0
}

# 2. One missing value is flagged and named in the message.
test_one_missing_value_is_flagged if {
	violations := violations_for([make_template("partial-template", ["UEFI_COMPATIBLE"])])
	count(violations) == 1
	some v in violations
	v.name == "partial-template"
	contains(v.message, "SEV_CAPABLE")
	not contains(v.message, "UEFI_COMPATIBLE")
}

# 3. An unset attribute counts as empty, so every required value is missing.
test_unset_attribute_is_flagged if {
	violations := violations_for([make_template_without_features("bare-template")])
	count(violations) == 1
	some v in violations
	contains(v.message, "SEV_CAPABLE, UEFI_COMPATIBLE")
}

# 4. An empty list is flagged.
test_empty_list_is_flagged if {
	count(violations_for([make_template("empty-template", [])])) == 1
}

# 5. Extra values beyond the required ones are allowed.
test_extra_values_are_allowed if {
	count(violations_for([make_template("extra-template", ["UEFI_COMPATIBLE", "SEV_CAPABLE", "GVNIC"])])) == 0
}

# 6. A single string is treated as a one-item list.
test_single_string_is_treated_as_list if {
	violations := element_required.get_violations(
		mock_variables,
		features_path,
		["UEFI_COMPATIBLE"],
	) with input as make_plan([make_template("string-template", "UEFI_COMPATIBLE")])
	count(violations) == 0
}

# 7. Resources of another type are ignored.
test_other_resource_types_are_ignored if {
	other := object.union(make_template_without_features("other"), {"type": "google_compute_instance"})
	count(violations_for([other])) == 0
}

# 8. Only the non-compliant resource is flagged when several are present.
test_only_non_compliant_resource_is_flagged if {
	violations := violations_for([
		make_template("good-template", ["UEFI_COMPATIBLE", "SEV_CAPABLE"]),
		make_template("bad-template", ["GVNIC"]),
	])
	count(violations) == 1
	some v in violations
	v.name == "bad-template"
}

# 9. Several missing values are listed in sorted order.
test_missing_values_are_sorted if {
	violations := violations_for([make_template("sorted-template", ["GVNIC"])])
	some v in violations
	contains(v.message, "missing required value(s)")
	contains(v.message, "SEV_CAPABLE, UEFI_COMPATIBLE")
}

make_template_with_disks(name, disks) := {
	"type": "google_compute_instance_template",
	"name": name,
	"values": {"name": name, "disk": disks},
}

every_disk_path := ["disk", "guest_os_features"]

disk_violations(resource, path, values) := violations if {
	violations := element_required.get_violations(mock_variables, path, values) with input as make_plan([resource])
}

# 10. Without an index, every disk is checked: only the second disk is missing a
# feature, and it is flagged by its own path.
test_second_disk_missing_feature_is_flagged if {
	resource := make_template_with_disks("two-disks", [
		{"guest_os_features": ["UEFI_COMPATIBLE", "SEV_CAPABLE"]},
		{"guest_os_features": ["UEFI_COMPATIBLE"]},
	])
	violations := disk_violations(resource, every_disk_path, required_features)
	count(violations) == 1
	some v in violations
	contains(v.message, "disk.[1].guest_os_features' is missing SEV_CAPABLE")
	not contains(v.message, "disk.[0]")
}

# 11. With an explicit index, only that element is checked.
test_explicit_index_checks_only_that_disk if {
	resource := make_template_with_disks("two-disks", [
		{"guest_os_features": ["UEFI_COMPATIBLE", "SEV_CAPABLE"]},
		{"guest_os_features": []},
	])
	count(disk_violations(resource, ["disk", 0, "guest_os_features"], required_features)) == 0
	count(disk_violations(resource, ["disk", 1, "guest_os_features"], required_features)) == 1
}

# 12. Every failing disk is listed in one violation for the resource.
test_every_failing_disk_is_listed if {
	resource := make_template_with_disks("three-disks", [
		{"guest_os_features": ["UEFI_COMPATIBLE", "SEV_CAPABLE"]},
		{"guest_os_features": ["SEV_CAPABLE"]},
		{},
	])
	violations := disk_violations(resource, every_disk_path, required_features)
	count(violations) == 1
	some v in violations
	contains(v.message, "disk.[1].guest_os_features' is missing UEFI_COMPATIBLE")
	contains(v.message, "disk.[2].guest_os_features' is missing SEV_CAPABLE, UEFI_COMPATIBLE")
}

# 13. A template with no disk blocks has nothing to check.
test_no_disks_is_not_flagged if {
	count(disk_violations(make_template_with_disks("no-disks", []), every_disk_path, required_features)) == 0
}

# 14. Matching is exact: a lowercase value does not satisfy an uppercase requirement.
test_matching_is_case_sensitive if {
	resource := make_template_with_disks("lowercase", [{"guest_os_features": ["uefi_compatible", "SEV_CAPABLE"]}])
	some v in disk_violations(resource, every_disk_path, required_features)
	contains(v.message, "is missing UEFI_COMPATIBLE")
}

# 15. A single non-list value is treated as a one-item list, so a boolean can be required.
test_boolean_value_is_treated_as_one_item_list if {
	resource := make_template_with_disks("bool", [{"auto_delete": true}, {"auto_delete": false}])
	some v in disk_violations(resource, ["disk", "auto_delete"], [true])
	contains(v.message, "disk.[1].auto_delete")
	not contains(v.message, "disk.[0]")
}
