package terraform.helpers.policies.presence_test

import data.terraform.helpers.policies.presence
import rego.v1

# These values describe the Terraform resource used by the mock plans below.
mock_variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

access_config_path := ["network_interface", 0, "access_config"]

email_path := ["service_account", 0, "email"]

# Small builders keep each test focused on the behaviour being checked.
make_plan(resources) := {
	"planned_values": {
		"root_module": {
			"resources": resources,
		},
	},
}

make_template(name, values) := {
	"type": "google_compute_instance_template",
	"name": name,
	"values": object.union({"name": name}, values),
}

violations_for(resources, path, mode) := violations if {
	violations := presence.get_violations(
		mock_variables,
		path,
		[mode],
	) with input as make_plan(resources)
}

public_nic := {"network_interface": [{"network": "default", "access_config": [{"nat_ip": ""}]}]}

private_nic := {"network_interface": [{"network": "default", "access_config": []}]}

# 1. "unset" flags a configured block.
test_unset_flags_present_block if {
	violations := violations_for([make_template("public-template", public_nic)], access_config_path, "unset")
	count(violations) == 1
	some v in violations
	v.name == "public-template"
	contains(v.message, "must not be set")
}

# 2. "unset" passes an absent block, which the plan writes as [].
test_unset_passes_empty_block if {
	count(violations_for([make_template("private-template", private_nic)], access_config_path, "unset")) == 0
}

# 3. "unset" passes when the path is missing entirely.
test_unset_passes_missing_path if {
	count(violations_for([make_template("bare-template", {})], access_config_path, "unset")) == 0
}

# 4. "unset" treats null, "" and {} as unset.
test_unset_treats_empty_values_as_unset if {
	every value in [null, "", {}] {
		count(violations_for([make_template("t", {"description": value})], ["description"], "unset")) == 0
	}
}

# 5. false and 0 are real values, so "unset" flags them.
test_false_and_zero_count_as_set if {
	every value in [false, 0] {
		count(violations_for([make_template("t", {"can_ip_forward": value})], ["can_ip_forward"], "unset")) == 1
	}
}

# 6. "set" flags a missing attribute.
test_set_flags_missing_attribute if {
	resource := make_template("no-email", {"service_account": [{"scopes": ["cloud-platform"]}]})
	violations := violations_for([resource], email_path, "set")
	count(violations) == 1
	some v in violations
	contains(v.message, "must be set")
}

# 7. "set" passes a populated attribute.
test_set_passes_populated_attribute if {
	resource := make_template("with-email", {"service_account": [{"email": "sa@p.iam.gserviceaccount.com"}]})
	count(violations_for([resource], email_path, "set")) == 0
}

# 8. The mode is case-insensitive.
test_mode_is_case_insensitive if {
	count(violations_for([make_template("t", public_nic)], access_config_path, "UNSET")) == 1
}

# 9. Messages never include the attribute's value.
test_value_is_not_reported if {
	resource := make_template("t", {"metadata_startup_script": "curl secret-host | bash"})
	violations := violations_for([resource], ["metadata_startup_script"], "unset")
	some v in violations
	not contains(v.message, "secret-host")
}

# 10. Resources of another type are ignored.
test_other_resource_types_are_ignored if {
	other := object.union(make_template("other", public_nic), {"type": "google_compute_instance"})
	count(violations_for([other], access_config_path, "unset")) == 0
}

# 11. Only the non-compliant resource is flagged when several are present.
test_only_non_compliant_resource_is_flagged if {
	violations := violations_for([
		make_template("private-template", private_nic),
		make_template("public-template", public_nic),
	], access_config_path, "unset")
	count(violations) == 1
	some v in violations
	v.name == "public-template"
}

every_nic_path := ["network_interface", "access_config"]

two_nics := {"network_interface": [
	{"network": "default", "access_config": []},
	{"network": "default", "access_config": [{"nat_ip": ""}]},
]}

# 12. Without an index, every interface is checked: only the second has an
# external IP and it is flagged by its own path.
test_second_interface_is_flagged if {
	violations := violations_for([make_template("two-nics", two_nics)], every_nic_path, "unset")
	count(violations) == 1
	some v in violations
	contains(v.message, "network_interface.[1].access_config")
	not contains(v.message, "network_interface.[0]")
}

# 13. An explicit index checks only that interface.
test_explicit_index_checks_only_that_interface if {
	count(violations_for([make_template("two-nics", two_nics)], ["network_interface", 0, "access_config"], "unset")) == 0
	count(violations_for([make_template("two-nics", two_nics)], ["network_interface", 1, "access_config"], "unset")) == 1
}

# 14. The path is followed through two repeated blocks (rules, then action).
test_path_through_two_repeated_blocks if {
	route := {
		"type": "google_compute_instance_template",
		"name": "route",
		"values": {"name": "route", "rules": [
			{"action": [{"redirect": []}]},
			{"action": [{"redirect": [{"host_redirect": "example.com"}]}]},
		]},
	}
	violations := violations_for([route], ["rules", "action", "redirect"], "unset")
	some v in violations
	contains(v.message, "rules.[1].action.[0].redirect")
	not contains(v.message, "rules.[0]")
}

# 15. "set" applies only to blocks that exist: a second service_account block
# without an email is flagged, and a template with no block is not.
test_set_checks_only_configured_blocks if {
	two_accounts := make_template("two-accounts", {"service_account": [
		{"email": "sa@p.iam.gserviceaccount.com"},
		{"scopes": ["cloud-platform"]},
	]})
	violations := violations_for([two_accounts], ["service_account", "email"], "set")
	some v in violations
	contains(v.message, "service_account.[1].email")
	count(violations_for([make_template("none", {"service_account": []})], ["service_account", "email"], "set")) == 0
}

