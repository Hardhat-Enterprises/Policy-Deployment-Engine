package machine_type.machine_type

import future.keywords.in

default allow := false

allowed_machine_types := ["shared-core", "standard"]

compute_instances := [
r |
	r := input.resource_changes[_]
	r.type == "google_compute_instance"
]

is_allowed_machine_type(mt) if {
	contains(mt, "micro") # shared-core
} else if {
	contains(mt, "small") # shared-core
} else if {
	contains(mt, "medium") # shared-core
} else if {
	contains(mt, "standard") # standard
}

deny[msg] if {
	some i
	r := compute_instances[i]

	not is_allowed_machine_type(r.change.after.machine_type)

	msg := sprintf(
		"Machine type '%v' is not allowed. Must be shared-core (micro, small, medium) or standard type.",
		[r.change.after.machine_type],
	)
}

allow if {
	count(deny) == 0
}
