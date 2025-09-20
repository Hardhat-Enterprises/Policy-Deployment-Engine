package terraform.gcp.security.dataplex.google_dataplex_asset.labels

import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

default details := []
default message := []

missing_owner[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type

  after := rc.change.after
  not after.labels.owner

  d := {
    "resource_address": rc.address,
    "attribute": "labels.owner",
    "why": "Dataplex Asset must have an 'owner' label"
  }
}

details := [d | d := missing_owner[_]]

message := ["Dataplex Asset must have an owner label"] if { count(details) > 0 }
