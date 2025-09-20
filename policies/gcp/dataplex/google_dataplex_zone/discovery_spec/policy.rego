package terraform.gcp.security.dataplex.google_dataplex_zone.discovery_spec

import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

default details := []
default message := []

discovery_not_enabled[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  after := rc.change.after

  not after.discovery_spec.enabled

  d := {
    "resource_address": rc.address,
    "attribute": "discovery_spec.enabled",
    "why": "Dataplex Zone must have discovery enabled"
  }
}

details := [d | d := discovery_not_enabled[_]]

message := ["Discovery must be enabled for all Dataplex Zones"] if {
  count(details) > 0
}
