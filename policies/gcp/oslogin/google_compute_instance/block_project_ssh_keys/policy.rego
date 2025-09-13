package terraform.gcp.security.oslogin.google_compute_instance.block_project_ssh_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

# Scenario: Instances must block project-wide SSH keys when OS Login is enabled
conditions := [
    [
        {
            "situation_description": "Instances must block project-wide SSH keys when OS Login is enabled",
            "remedies": [
                "Set metadata.block-project-ssh-keys = TRUE",
                "Remove metadata.block-project-ssh-keys = FALSE"
            ]
        },
        {
            "condition": "block-project-ssh-keys metadata key must equal TRUE",
            "attribute_path": ["metadata", "block-project-ssh-keys"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ]
]


raw_message := helpers.get_multi_summary(conditions, vars.variables).message
raw_details := helpers.get_multi_summary(conditions, vars.variables).details

#
message := [fix_line(line) | line := raw_message[_]]
details := raw_details


fix_line(line) = new if {
  contains(line, "Non-Compliant Resources:")
  not endswith(line, "All passed")

 
  raw := trim_prefix(line, "Non-Compliant Resources:")
  cleaned := trim(raw, " []")
  zones := split(cleaned, ",")

  mapped := [sprintf("%s (%s)", [inst.values.name, z_trim]) |
    z := zones[_]
    z_trim := trim(z, " ")
    inst := input.planned_values.root_module.resources[_]
    inst.type == "google_compute_instance"
    inst.values.zone == z_trim
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
