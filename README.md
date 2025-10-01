# Policy-Deployment-Engine
# GCP Rego Policy Project: gcp-rego-policy

**Project ID:** gcp-rego-policy  

---

## Overview

This repository contains Open Policy Agent (OPA) Rego policies for automated security compliance evaluation of GCP resources under the project **gcp-rego-policy**.  

It evaluates **10 security-relevant attributes** across multiple services, returning **pass/fail messages** for each resource.

---

## Folder Structure

gcp-rego-policy/
├── inputs/
│ └── gcp/
│ └── <SERVICE>/
│ └── <RESOURCE>/
│ └── <ATTRIBUTE>/plan.json
├── policies/
│ └── gcp/
│ └── <SERVICE>/
│ └── <RESOURCE>/
│ ├── <ATTRIBUTE>/policy.rego
│ └── vars.rego

markdown
Copy code

**Guidelines:**
- One policy per attribute folder.
- One `vars.rego` per resource folder.
- Multiple attributes per resource allowed.
- Multiple resources per service allowed.

**Example:**  

- Service: `compute`  
- Resource: `google_compute_firewall`  
- Attributes: `ssh_open_to_world`, `rdp_open_to_world`, `telnet_enabled`, etc.  

---

## Policy Evaluation
All 10 policies are designed to evaluate specific security-relevant attributes of GCP resources. Each policy follows the PDE standard structure:

vars.rego defines the resource type and resource value name.

policy.rego returns three objects:
message – describes non-compliance.
details – provides resource details.
result – returns pass/fail based on the message array.
**Basic Outcome:**

```powershell
opa eval --data .\policies\gcp --input .\inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>.message" --format pretty
Detailed Resource Info:

opa eval --data .\policies\gcp --input .\inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>.details" --format pretty
See All Failures with Explanation:

opa eval --data .\policies\gcp --input .\inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>.message" --format pretty --explain=fails
Policy Development
Each attribute has its own policy.rego and vars.rego.

vars.rego (SSH firewall):
package terraform.gcp.security.compute.ssh.vars

variables = {
  "friendly": "SSH Firewall Rule",
  "resource_type": "google_compute_firewall",
  "resource_value_name": "name"
}
policy.rego  (SSH open to world):

package terraform.gcp.security.compute.ssh.open_to_world

import data.terraform.gcp.security.compute.ssh.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.port == 22
    input.planned_values.root_module.resources[i].values.source_ranges[_] == "0.0.0.0/0"
    msg := sprintf(
        "Resource '%s' exposes SSH (port 22) to the world (0.0.0.0/0).",
        [input.planned_values.root_module.resources[i].name])
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "port": input.planned_values.root_module.resources[i].values.port,
        "source_ranges": input.planned_values.root_module.resources[i].values.source_ranges
    }
}

result[res] if { msg := message[_]; res := {"status": "fail", "message": msg} }
result[res] if { count(message) == 0; res := {"status": "pass", "message": "No non-compliant SSH firewall rules found."} }
Similar structures exist for all 10 rules under gcp-rego-policy.

Nested Attributes
location
"attribute_path": ["location"]

..
Evaluating All Policies

opa eval --input "inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json" --data "policies" "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>" --format pretty
Each policy returns pass/fail along with non-compliant resource details.
