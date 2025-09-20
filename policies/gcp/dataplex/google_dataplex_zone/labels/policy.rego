package terraform.gcp.security.dataplex.google_dataplex_zone.labels

import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

default details := []
default message := []

missing_owner_label[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  after := rc.change.after

  not after.labels.owner

  d := {
    "resource_address": rc.address,
    "attribute": "labels.owner",
    "why": "Every Dataplex Zone must have an 'owner' label"
  }
}

details := [d | d := missing_owner_label[_]]

message := ["Missing required 'owner' label on one or more Dataplex Zones"] if {
  count(details) > 0
}
