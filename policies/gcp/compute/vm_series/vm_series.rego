package vm_series.vm_series

import future.keywords.in

default allow := false

# Allow only E2 VM Series
allowed_series_prefix := "e2-"

compute_instances := [
r |
	r := input.resource_changes[_]
	r.type == "google_compute_instance"
]

deny[msg] if {
	some i
	r := compute_instances[i]

	not startswith(r.change.after.machine_type, allowed_series_prefix)

	msg := sprintf(
		"VM series for machine type '%v' is not allowed. Only E2 series is permitted.",
		[r.change.after.machine_type],
	)
}

allow if {
	count(deny) == 0
}
