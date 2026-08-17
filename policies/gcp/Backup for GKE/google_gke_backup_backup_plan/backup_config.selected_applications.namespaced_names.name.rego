package policy

import rego.v1

deny contains msg if {
    input.value == ""
    msg := "selected application name must not be empty"
}
