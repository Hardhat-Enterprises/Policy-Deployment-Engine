package terraform.gcp.security.oslogin.google_compute_instance.enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

# Scenario: All instances must have OS Login enabled
conditions := [
    [
        {
            "situation_description": "Instances must have OS Login enabled",
            "remedies": [
                "Set metadata.enable-oslogin = TRUE",
                "Remove metadata.enable-oslogin = FALSE"
            ]
        },
        {
            "condition": "OS Login metadata key must equal TRUE",
            "attribute_path": ["metadata", "enable-oslogin"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ]
]

raw_message := helpers.get_multi_summary(conditions, vars.variables).message
raw_details := helpers.get_multi_summary(conditions, vars.variables).details


message := [fix_line(line) | line := raw_message[_]]
details := raw_details


fix_line(line) = new if {
  contains(line, "Non-Compliant Resources:")
  not endswith(line, "All passed")

  parts := split(line, ": ")
  zones_raw := parts[1]
  zones := split(zones_raw, ", ")

 
  mapped := [sprintf("%s (%s)", [inst.values.name, z]) |
    z := zones[_]
    inst := input.planned_values.root_module.resources[_]
    inst.type == "google_compute_instance"
    inst.values.zone == trim(z, " ")
  ]

  new := sprintf("Non-Compliant Resources: %s", [concat(", ", mapped)])
}

fix_line(line) = line if {
  contains(line, "Non-Compliant Resources:")
  endswith(line, "All passed")
}


fix_line(line) = line if {
  not contains(line, "Non-Compliant Resources:")
}
