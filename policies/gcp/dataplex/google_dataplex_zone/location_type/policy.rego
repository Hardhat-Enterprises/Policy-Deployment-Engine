package terraform.gcp.security.dataplex.google_dataplex_zone.location_type

import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

default details := []
default message := []

not_single_region[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  after := rc.change.after

  after.resource_spec.location_type != "SINGLE_REGION"

  d := {
    "resource_address": rc.address,
    "attribute": "resource_spec.location_type",
    "why": "Dataplex Zone must be SINGLE_REGION for data residency compliance"
  }
}

details := [d | d := not_single_region[_]]

message := ["Dataplex Zone must have resource_spec.location_type = SINGLE_REGION"] if { count(details) > 0 }
