package policy

import rego.v1

deny contains msg if {
    input.value == ""
    msg := "selected application namespace must not be empty"
}
