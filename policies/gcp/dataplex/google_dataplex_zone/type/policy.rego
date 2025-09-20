package terraform.gcp.security.dataplex.google_dataplex_zone.type

import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

default details := []
default message := []

invalid_type[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  after := rc.change.after

  after.type != "RAW"
  after.type != "CURATED"

  d := {
    "resource_address": rc.address,
    "attribute": "type",
    "why": "Dataplex Zone type must be RAW or CURATED"
  }
}

details := [d | d := invalid_type[_]]

message := ["Dataplex Zone must have type RAW or CURATED"] if { count(details) > 0 }
