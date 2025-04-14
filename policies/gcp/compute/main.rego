package terraform.analysis
#package gcp.compute.analysis

#import data.disk_size
#import data.machine_type
#import data.os_type
#import data.region
#import data.vm_series
#import data.zone

import data.disk.size
import data.machine_type.machine_type
import data.os_type.os_type
import data.region.region
import data.zone.zone
import data.vm_series.vm_series

default allow := false

deny[msg] if msg := region.deny[_]
deny[msg] if msg := zone.deny[_]
deny[msg] if msg := vm_series.deny[_]
deny[msg] if msg := machine_type.deny[_]
deny[msg] if msg := os_type.deny[_]
deny[msg] if msg := size.deny[_]

allow if count(deny) == 0

