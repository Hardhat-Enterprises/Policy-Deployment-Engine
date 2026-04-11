package terraform.gcp.security.cloud_pub_sub.google_pubsub_schema.type_test

import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_schema.type
import rego.v1

# Mock: compliant resource with type = PROTOCOL_BUFFER
mock_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_schema",
			"values": {
				"name": "c",
				"type": "PROTOCOL_BUFFER",
				"definition": "syntax = \"proto3\"; message Results { string message_request = 1; }",
			},
		},
	]}},
}

# Mock: non-compliant resource with type = TYPE_UNSPECIFIED
mock_non_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_schema",
			"values": {
				"name": "nc",
				"type": "TYPE_UNSPECIFIED",
			},
		},
	]}},
}

# Mock: non-compliant resource with type absent entirely
mock_non_compliant_absent := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_schema",
			"values": {
				"name": "nc",
			},
		},
	]}},
}

# Test 1: Compliant resource produces no violations
test_schema_type_compliant if {
	result := type.result with input as mock_compliant
	every detail in result.details {
		count(detail.non_compliant_resources) == 0
	}
}

# Test 2: Non-compliant resource is flagged
test_schema_type_non_compliant if {
	result := type.result with input as mock_non_compliant
	some detail in result.details
	count(detail.non_compliant_resources) > 0
}

# Test 3: Message contains the resource name when non-compliant
test_schema_type_message_contains_resource if {
	result := type.result with input as mock_non_compliant
	some msg in result.message
	contains(msg, "Pub/Sub Schema")
}

# Test 4: Absent type attribute is also flagged as non-compliant
test_schema_type_absent_is_non_compliant if {
	result := type.result with input as mock_non_compliant_absent
	some detail in result.details
	count(detail.non_compliant_resources) > 0
}
