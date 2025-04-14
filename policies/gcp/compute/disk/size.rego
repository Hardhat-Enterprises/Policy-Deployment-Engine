package disk.size

import future.keywords.in

default allow := false

max_disk_size_gb := 20

compute_instances := [
r |
	r := input.resource_changes[_]
	r.type == "google_compute_instance"
]

deny[msg] if {
	some i
	r := compute_instances[i]

	size := to_number(r.change.after.boot_disk[0].initialize_params[0].size)
	size > max_disk_size_gb

	msg := sprintf(
		"Boot disk size '%v GB' exceeds maximum allowed size of %v GB.",
		[size, max_disk_size_gb],
	)
}

allow if {
	count(deny) == 0
}
