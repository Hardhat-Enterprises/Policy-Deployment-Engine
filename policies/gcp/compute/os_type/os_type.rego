package os_type.os_type

import future.keywords.in

default allow := false

allowed_os := ["centos", "debian"]

compute_instances := [
r |
	r := input.resource_changes[_]
	r.type == "google_compute_instance"
]

deny[msg] if {
	some i
	r := compute_instances[i]

	image := lower(r.change.after.boot_disk[0].initialize_params[0].image)

	not contains(image, allowed_os[0])
	not contains(image, allowed_os[1])

	msg := sprintf(
		"OS image '%v' is not allowed. Must contain 'centos' or 'debian'.",
		[image],
	)
}

allow if {
	count(deny) == 0
}
