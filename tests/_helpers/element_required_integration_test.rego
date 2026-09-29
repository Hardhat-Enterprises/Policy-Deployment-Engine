package terraform.helpers.element_required_integration_test

import data.terraform.helpers
import rego.v1

# Runs element required conditions through the full dispatcher and summary,
# exactly as a policy file would.

variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

plan_for(disk) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_compute_instance_template",
	"name": "example-template",
	"values": {"name": "example-template", "disk": [disk]},
}]}}}

feature_conditions(policy_type) := [[
	{
		"situation_description": "The boot disk does not enable the guest OS features required for Shielded VM and Confidential VM support",
		"remedies": ["Add UEFI_COMPATIBLE and SEV_CAPABLE to disk.guest_os_features."],
	},
	{
		"condition": "disk.guest_os_features contains every required feature",
		"attribute_path": ["disk", 0, "guest_os_features"],
		"values": ["UEFI_COMPATIBLE", "SEV_CAPABLE"],
		"policy_type": policy_type,
	},
]]

# 1. A disk with every required feature passes.
test_all_features_present_passes if {
	result := helpers.get_multi_summary(feature_conditions("element required"), variables) with input as plan_for({"guest_os_features": ["UEFI_COMPATIBLE", "SEV_CAPABLE"]})
	contains(json.marshal(result.message), "None - All passed")
}

# 2. A missing feature is reported, naming the resource and the feature.
test_missing_feature_is_reported if {
	result := helpers.get_multi_summary(feature_conditions("element required"), variables) with input as plan_for({"guest_os_features": ["UEFI_COMPATIBLE"]})
	out := json.marshal(result)
	not contains(out, "None - All passed")
	contains(out, "example-template")
	contains(out, "SEV_CAPABLE")
}

# 3. A disk with no guest_os_features at all is reported.
test_unset_features_are_reported if {
	result := helpers.get_multi_summary(feature_conditions("element required"), variables) with input as plan_for({"source_image": "debian-cloud/debian-11"})
	out := json.marshal(result)
	not contains(out, "None - All passed")
	contains(out, "SEV_CAPABLE, UEFI_COMPATIBLE")
}

# 4. The type name is case-insensitive, like every other policy_type.
test_mixed_case_type_name_is_supported if {
	result := helpers.get_multi_summary(feature_conditions("Element Required"), variables) with input as plan_for({"guest_os_features": ["UEFI_COMPATIBLE"]})
	out := json.marshal(result)
	not contains(out, "None - All passed")
	not contains(out, "POLICY ERROR")
}
# 5. An empty values list is a POLICY ERROR, not a silent pass.
test_empty_values_report_policy_error if {
	conditions := [[feature_conditions("element required")[0][0], object.union(feature_conditions("element required")[0][1], {"values": []})]]
	result := helpers.get_multi_summary(conditions, variables) with input as plan_for({})
	contains(json.marshal(result.message), "POLICY ERROR")
}

# 6. Missing values is a POLICY ERROR.
test_missing_values_report_policy_error if {
	conditions := [[feature_conditions("element required")[0][0], object.remove(feature_conditions("element required")[0][1], ["values"])]]
	result := helpers.get_multi_summary(conditions, variables) with input as plan_for({})
	contains(json.marshal(result.message), "POLICY ERROR")
}

# 7. An empty string among the values is a POLICY ERROR.
test_blank_value_reports_policy_error if {
	conditions := [[feature_conditions("element required")[0][0], object.union(feature_conditions("element required")[0][1], {"values": ["UEFI_COMPATIBLE", ""]})]]
	result := helpers.get_multi_summary(conditions, variables) with input as plan_for({})
	contains(json.marshal(result.message), "POLICY ERROR")
}

# 8. A whitespace-padded value is a POLICY ERROR: it could never match.
test_padded_value_reports_policy_error if {
	conditions := [[feature_conditions("element required")[0][0], object.union(feature_conditions("element required")[0][1], {"values": ["UEFI_COMPATIBLE "]})]]
	result := helpers.get_multi_summary(conditions, variables) with input as plan_for({})
	contains(json.marshal(result.message), "POLICY ERROR")
}

two_disk_plan(disks) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_compute_instance_template",
	"name": "example-template",
	"values": {"name": "example-template", "disk": disks},
}]}}}

every_disk_conditions := [[
	feature_conditions("element required")[0][0],
	object.union(feature_conditions("element required")[0][1], {"attribute_path": ["disk", "guest_os_features"]}),
]]

# 9. Through the dispatcher, a problem in the second disk is reported.
test_second_disk_is_reported if {
	result := helpers.get_multi_summary(every_disk_conditions, variables) with input as two_disk_plan([
		{"guest_os_features": ["UEFI_COMPATIBLE", "SEV_CAPABLE"]},
		{"guest_os_features": ["UEFI_COMPATIBLE"]},
	])
	out := json.marshal(result)
	not contains(out, "None - All passed")
	contains(out, "disk.[1].guest_os_features")
}

# 10. Every disk compliant passes.
test_every_disk_compliant_passes if {
	result := helpers.get_multi_summary(every_disk_conditions, variables) with input as two_disk_plan([
		{"guest_os_features": ["UEFI_COMPATIBLE", "SEV_CAPABLE"]},
		{"guest_os_features": ["SEV_CAPABLE", "UEFI_COMPATIBLE", "GVNIC"]},
	])
	contains(json.marshal(result.message), "None - All passed")
}
