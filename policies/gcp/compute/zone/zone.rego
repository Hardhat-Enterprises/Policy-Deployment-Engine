package zone.zone

import future.keywords.in

allowed_zones := [
	"australia-southeast1-a",
	"australia-southeast1-b",
	"australia-southeast2-a",
]

compute_instances := [
r |
	r := input.resource_changes[_]
	r.type == "google_compute_instance"
]

# ✅ Deny rule that returns a message
deny[msg] if {
	some i
	r := compute_instances[i]

	not r.change.after.zone in allowed_zones

	msg := sprintf("❌ Zone Policy Failed: '%v' is not allowed. Allowed zones are: %v", [r.change.after.zone, allowed_zones])
}

allow if {
	count(deny) == 0
}
