<a id="top"></a>
<h1 align="center">policy.rego</h1>

> Your policy file is named after the attribute it checks — `<attribute>.rego` — and lives
> **flat** in the resource folder `policies/gcp/<Service>/<resource type>/` (there is no
> per-attribute subfolder).

### Rego package naming convention from directory structure

The package name in your `<attribute>.rego` file must follow the directory structure of your policy.



![policy-rego-packages](images/rego-package-name-top.PNG)


![policy-rego-packages-vars](images/rego-package-name-vars.PNG)


### Example

```rego
package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.available_memory_mb 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars
```
## Attribute Paths
Attribute paths are used to locate specific values inside the Terraform `plan.json` file.
They map directly to the structure of the JSON and are used to extract values from a resource.

Your attribute paths come from the `json` plan you created using the following commands:

`terraform plan --out=plan`  
`terraform show -json plan > plan.json`

### Format Document 

Make sure to format the document so it becomes readable

![format-json-document](images/format-document.PNG)

Transforms it into this

![formatted-json-document](images/json-formatted.PNG)


### How to determine your attribute path

1. Navigate to:

`planned_values → root_module → resources → values`

2. Find the attribute you want to check.

3. Convert it into an attribute path:

- If the value is **directly inside `values`**, use:
  
      ["attribute_name"]

- If the value is **nested inside objects or arrays**, include each level.

### Example (Simple Attribute)

From the JSON:

    "values": {
      "available_memory_mb": 256
    }

The attribute path is:

    ["available_memory_mb"]


### Example (Nested Attribute)

If the structure was:

    "values": {
      "rsa": [
        {
          "key": 2048
        }
      ]
    }

The attribute path would be:

    ["rsa", 0, "key"]


### Different ways to write your policy

---

### Whitelist

Whitelist allows only specific values and blocks everything else.

```rego

    [
      {
        "situation_description": "Resource is not using Linux",
        "remedies": ["Change the OS to linux"]
      },
      {
        "condition": "Test if an OS is not Linux",
        "attribute_path": ["parent"],
        "values": ["Linux"],
        "policy_type": "whitelist"
      }
    ]
```


### Blacklist

Blacklist disallows specific values.
```rego
    [
      {
        "situation_description": "Resource is using Linux",
        "remedies": ["Change the OS from linux"]
      },
      {
        "condition": "Test if an OS is Linux",
        "attribute_path": ["parent"],
        "values": ["Linux"],
        "policy_type": "blacklist"
      }
    ]
```
---

### Range

Range is used with numeric values to enforce minimum, maximum, or bounded ranges.



### Minimum

Ensures a value is above a minimum threshold.
```rego
    [
      {
        "situation_description": "Check if key is over 1000 bits",
        "remedies": ["Enforce a key over 1000 bits"]
      },
      {
        "condition": "Test if key size is over 1000 bits",
        "attribute_path": ["rsa", 0, "key"],
        "values": [1000, null],
        "policy_type": "range"
      }
    ]
```


### Maximum

Ensures a value is below a maximum threshold.
```rego
    [
      {
        "situation_description": "Check if key is under 1000 bits",
        "remedies": ["Enforce a key under 1000 bits"]
      },
      {
        "condition": "Test if key size is under 1000 bits",
        "attribute_path": ["rsa", 0, "key"],
        "values": [null, 1000],
        "policy_type": "range"
      }
    ]
```


### Range (Bounded)

Ensures a value falls within a specific range.
```rego
    [
      {
        "situation_description": "Check if key is between 1000 and 2000 bits",
        "remedies": ["Ensure key is 1000 to 2000 bits"]
      },
      {
        "condition": "Test if key size is within 1000 to 2000 bits",
        "attribute_path": ["rsa", 0, "key"],
        "values": [1000, 2000],
        "policy_type": "range"
      }
    ]
```


### Pattern Whitelist

Allows only values that match a defined pattern.
```rego
    [
      {
        "situation_description": "Check description fits a defined pattern",
        "remedies": ["Fix description to fit pattern"]
      },
      {
        "condition": "Wrong description pattern",
        "attribute_path": ["description"],
        "values": ["project/*/gcp/*", [["a","c","d"],["b","d"]]],
        "policy_type": "pattern whitelist"
      }
    ]
```


### Pattern Blacklist

Blocks values that match a defined pattern.
```rego
    [
      {
        "situation_description": "Check description fits a defined pattern",
        "remedies": ["Fix description to fit pattern"]
      },
      {
        "condition": "Wrong description pattern",
        "attribute_path": ["description"],
        "values": ["project/*", [["root"]]],
        "policy_type": "pattern blacklist"
      }
    ]
```

<div align="center">

[⬅️ Previous: _vars.rego](vars-rego.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: Testing your policies ➡️](testing-policies.md#top) 

</div>