package terraform.gcp.security.cloud_bigtable.google_bigtable_instance.labels

import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars

default message := "COMPLIANT"
default details := []

############################
# Helpers (no slice/contains)
############################

# Walk a path array by index, e.g. ["labels"] starting at idx=0
value_for_path_at(obj, path_arr, idx) := v if {
  count(path_arr) == idx
  v := obj
}
value_for_path_at(obj, path_arr, idx) := v if {
  count(path_arr) > idx
  k := path_arr[idx]
  next := idx + 1
  v := value_for_path_at(obj[k], path_arr, next)
}

# Wrapper: get nested value by path array
value_for_path(obj, path_arr) := v if {
  v := value_for_path_at(obj, path_arr, 0)
}

# Root-module resources of the target type
root_resource(res) if {
  r := input.planned_values.root_module.resources[_]
  r.type == vars.variables.resource_type
  res = r
}

# Child-module resources of the target type
child_resource(res) if {
  cm := input.planned_values.root_module.child_modules[_]
  r := cm.resources[_]
  r.type == vars.variables.resource_type
  res = r
}

# Unified iterator over all target resources
target_resource(res) if root_resource(res)
target_resource(res) if child_resource(res)

# Attribute map under test (labels)
attr_map(res) := m if {
  vals := res.values
  path := vars.variables.attribute_path
  m := value_for_path(vals, path)
}

############################
# Core evaluation
############################

# Any resource that violates any of the required labels?
non_compliant if {
  some res
  target_resource(res)
  labels := attr_map(res)
  some req
  req := vars.variables.required_labels[_]
  not labels[req.key] == req.equals
}

# Human-readable messages for every violation across all resources
details := ds if {
  ds := [msg |
    some res
    target_resource(res)
    labels := attr_map(res)
    some req
    req := vars.variables.required_labels[_]
    not labels[req.key] == req.equals
    name := res.values[vars.variables.resource_value_name]
    msg := sprintf("%s '%s': labels.%s must equal %s (got %v)",
            [vars.variables.friendly_resource_name, name, req.key, req.equals, labels[req.key]])
  ]
  count(ds) > 0
}
# default [] otherwise

# Cheatsheet-style overall message
message := m if {
  non_compliant
  m := sprintf(
    "NON-COMPLIANT: One or more %s resources fail %d label checks.",
    [vars.variables.friendly_resource_name, count(vars.variables.required_labels)]
  )
}
# default "COMPLIANT" otherwise

