package terraform.gcp.security.organization_policy.constraint

import data.terraform.gcp.security.organization_policy.vars

default details := []
default message := []

serial_port_not_disabled[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  after := rc.change.after

  after.constraint == "constraints/compute.disableSerialPortAccess"
  after.boolean_policy.enforced == false

  d := {
    "resource_address": rc.address,
    "attribute": "boolean_policy.enforced",
    "why": "Organization Policy must enforce disabling serial port access"
  }
}

details := [d | d := serial_port_not_disabled[_]]

message := ["Organization Policy must enforce disabling serial port access"] if {
  count(details) > 0
}
