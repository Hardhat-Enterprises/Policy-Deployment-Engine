package region.region

import future.keywords.in

default allow := false

allowed_regions := ["australia-southeast1", "australia-southeast2"]

compute_instances := [
r |
	r := input.resource_changes[_]
	r.type == "google_compute_instance"
]

deny[msg] if {
	some i
	r := compute_instances[i]

	zone_parts := split(r.change.after.zone, "-")
	region := sprintf("%v-%v", [zone_parts[0], zone_parts[1]])

	not region in allowed_regions

	msg := sprintf(
		"Region '%v' derived from zone '%v' is not allowed. Allowed regions: %v.",
		[region, r.change.after.zone, allowed_regions],
	)
}

allow if {
	count(deny) == 0
}
