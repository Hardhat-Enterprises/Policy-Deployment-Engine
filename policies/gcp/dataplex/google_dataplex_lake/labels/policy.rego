package terraform.gcp.security.dataplex.google_dataplex_lake.labels

import data.terraform.gcp.security.dataplex.google_dataplex_lake.vars

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
    "why": "Dataplex Lake must have an owner label for accountability"
  }
}

details := [d | d := missing_owner[_]]

message := ["Dataplex Lake missing required owner label"] if { count(details) > 0 }
