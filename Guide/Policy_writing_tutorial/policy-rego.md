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

### Paths through repeated blocks: one element or every element

Terraform writes every nested block as a list, even when there is only one, which is why
`rsa` above needs the `0`. How a path behaves when you leave that index out depends on the
`policy_type`, because the engine has two ways of reading a path:

| Types | Reads | Index left out |
|---|---|---|
| `blacklist`, `whitelist`, `range`, `pattern blacklist`, `pattern whitelist`, `element blacklist`, `element pattern whitelist`, `map key blacklist` | **one value** | Give an index at every list level. Without them, one list level is gathered into a list of values, and a path through **two** list levels (for example `rules` then `action`) reads as `null`, as if the attribute were unset |
| `element required`, `map key pattern whitelist`, `presence` | **every element** | Leave the indexes out to check every element of every repeated block. An index still selects one element. Messages name the failing element, such as `rules.[1].action.[0].redirect.[0].https_redirect` |

So a path copied from one group into the other does not mean the same thing. For example,
`["rules", "action", "redirect", "https_redirect"]` under `element required` with `values: [true]`
checks every configured redirect. The same path under `whitelist` with `values: [true]` reads
`null` for every route, and `null` is not in `[true]`, so it flags **every** route, including
routes whose redirects force HTTPS and routes with no redirect at all. Under `blacklist` the same
`null` passes every route. If you need a rule on every element, use one of the every-element types;
see the note in [Whitelist](#whitelist).


### Different ways to write your policy

The engine dispatches on `policy_type`, using these supported values:

| `policy_type` | Use it when | Repeated blocks |
|---|---|---|
| `blacklist` | The attribute must not be one of these values | One element: give an index per list level |
| `whitelist` | The attribute must be one of these values (arrays: **every** element must be) | One element: give an index per list level |
| `range` | A number must be above / below / between bounds | One element: give an index per list level |
| `pattern blacklist` | A wildcard-extracted part of the value must not be one of these | One element: give an index per list level |
| `pattern whitelist` | A wildcard-extracted part of the value must be one of these | One element: give an index per list level |
| `element blacklist` | No element of an array may **contain** one of these substrings | One element: give an index per list level |
| `element pattern whitelist` | Every element of an array must match one of the wildcard shapes | One element: give an index per list level |
| `map key blacklist` | No map key may match a prohibited name, ignoring capitalisation, with a non-empty value | One element: give an index per list level |
| `element required` | An array must **contain** every one of these values (unset counts as empty). A single value counts as a one-item list, so `[true]` means "must be true", in every element the path reaches | Every element: leave the indexes out |
| `map key pattern whitelist` | Every map key must match one of these wildcard shapes, ignoring capitalisation | Every element: leave the indexes out |
| `presence` | The attribute or block must be set (`["set"]`) or must not be set (`["unset"]`), whatever its value | Every element: leave the indexes out |

Write them **lowercase, with a space** — `pattern whitelist`, never `pattern_whitelist`. Anything
else is not a policy type: the engine cannot dispatch it, so it stops and reports
`POLICY ERROR: unknown policy_type ...` and your test goes red. `policy_lint`'s
[`unknown-policy-type`](policy-lint.md#unknown-policy-type) rule catches it before you get that far.

There is no *exact-match* `element whitelist`, and you do not need one — plain `whitelist`
already covers that (see the Whitelist note below). For *pattern*-based list whitelisting,
use `element pattern whitelist`.

---

### Whitelist

Whitelist allows only specific values and blocks everything else.

> **Whitelist already handles lists.** When the attribute is an array, the helper requires
> *every* element to be in your `values` set (it is a subset test), so
> `"attribute_path": ["allowed_ips"]` under a `whitelist` is a complete check — you do not need,
> and will not find, an *exact-match* `element whitelist`. `element blacklist` exists as a separate
> type only because *forbidding* a list needs substring matching, which the plain `blacklist` does
> not do. For *pattern*-based list validation (every element must match a shape), use
> `element pattern whitelist`.

> **Need a value on every element of a repeated block?** A `whitelist` reads one value, so it
> checks one element (give the index). To require a value in every element, for example
> "`https_redirect` must be true on every redirect of every rule", use `element required` with
> `values: [true]` and leave the indexes out:
> `["rules", "action", "redirect", "https_redirect"]`. It treats the single value as a one-item
> list, so `false` and an omitted value both fail, and rules without a redirect have nothing to
> check. See [Paths through repeated blocks](#paths-through-repeated-blocks-one-element-or-every-element).

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

Allows only values that match a defined pattern. `values` is **two** entries: a target string
whose `*` wildcards mark the parts you care about, then a list of allowed values *per wildcard
position* (first list for the first `*`, and so on). It is a wildcard match, not a regex.

> **Both entries are required, and a lone regex silently disables the condition.** Writing
> `"values": ["^projects/[^/]+/.../cryptoKeys/[^/]+$"]` is the most common mistake on this type.
> With only one entry there is no per-position list to compare against, so the condition
> **flags nothing at all** — unset, empty, malformed and correct values pass it equally. Nothing
> in your test run says so either: the kit still goes green, because a sibling condition is what
> catches your nonCompliant fixture. `policy_lint`'s
> [`pattern-values-shape`](policy-lint.md#pattern-values-shape) rule catches this. If what you
> want is "the value must have this shape", that is **`element pattern whitelist`** (below) —
> it takes a flat list of wildcard shapes and works on a plain string too.
>
> Giving *fewer* lists than there are `*`s is fine and deliberate: `["*://*", [["https"]]]`
> constrains the scheme and leaves the host unchecked. The lists are matched to the `*`s in
> order, and any position without a list is simply not checked.

> **A value that does not match the target is never flagged.** The helper extracts the wildcard
> parts out of the value first; if the value does not fit the target shape at all, there is
> nothing to extract and the resource passes. So `"project/*/gcp/*"` says "*if* it looks like
> this, the parts must be allowed" — it does **not** say "it must look like this". If the shape
> itself is the control, check the shape with an `element pattern whitelist` (or a `whitelist`,
> or a `pattern blacklist` on the bad shape) as a second condition.

> **Neither pattern type flags a missing value.** An argument that is absent has nothing to
> extract from, so it passes. Pair the pattern with a `blacklist` on `[null, ""]` when "it must
> be set" is part of the control — and list `null`, not just `""`: an argument left out of the
> Terraform reaches the engine as `null`. See
> [`presence-missing-null`](policy-lint.md#presence-missing-null).
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


### Element Blacklist

Blocks **array** attributes whose elements contain any blacklisted **substring** (simple
`contains` matching, not regex). `values` is a flat array of forbidden substrings.

> **It matches substrings, so it catches more than the exact value.** Blacklisting `"*"` also
> flags `"https://example.com/*"` and `"*.googleapis.com"`, because both *contain* a `*`. That
> is usually what you want for a wildcard check — but it means a short substring like `"dev"`
> will also flag `"developer-portal"`. Pick substrings that cannot appear innocently, or anchor
> them with a separator (`"dev-"`, `"-sandbox"`).
```rego
    [
      {
        "situation_description": "Resource names must only include authorized projects",
        "remedies": ["Remove unauthorized or non-production projects"]
      },
      {
        "condition": "Resource names contain a blacklisted substring",
        "attribute_path": ["resource_names"],
        "values": ["attacker-project", "test-project", "dev-", "-sandbox"],
        "policy_type": "element blacklist"
      }
    ]
```

### Map Key Blacklist

Checks the **names inside a map**, rather than list elements or the map's values.
`values` is a flat list of prohibited names. Matching ignores capitalisation but
requires the whole name: `Authorization` matches `AUTHORIZATION`, not
`X-Authorization-Mode`.

A matching key is flagged only when its value is neither `null` nor an empty
string. Whitespace-only values are still non-empty. Missing/null maps and empty
objects are allowed. Through `get_multi_summary`, a present non-map value causes
`POLICY ERROR:` rather than a passing result. For example, omitting the `0` from
the path below makes the shared extractor return an array of maps, not one map.
Check the path and include the list indexes. Paths resolving to missing/null are
still treated as absent optional maps. This checks known values in root-module
resources, like the other helpers.

```rego
    [
      {
        "situation_description": "The webhook contains sensitive inline request headers",
        "remedies": ["Move credentials to secret_versions_for_request_headers."]
      },
      {
        "condition": "Reject sensitive header names with non-empty inline values",
        "attribute_path": ["generic_web_service", 0, "request_headers"],
        "values": ["authorization", "proxy-authorization", "api-key", "x-api-key", "x-auth-token"],
        "policy_type": "map key blacklist"
      }
    ]
```

For the Service Directory webhook, use
`["service_directory", 0, "generic_web_service", 0, "request_headers"]` instead.
Violation messages name the matching keys without printing their values.
See the [helper documentation](../../policies/_helpers/README.md#7-map-key-blacklist)
for a complete conditions example and the test command.

### Element Pattern Whitelist

Allows only **array** attributes whose **every** element matches one of the required
wildcard shapes. `values` is a list of shape strings; an element passes if it matches
any one of them. Each `*` matches one path segment (one or more non-`/` characters), so
a `*` never spans a separator. A string attribute is checked as a one-item list. An
empty `values` list matches nothing, so it flags every element (a loud failure). This
is the positive (allowlist) counterpart to `element blacklist` for lists of resource
paths.
```rego
    [
      {
        "situation_description": "Guardrails must be explicit platform resource paths",
        "remedies": ["Reference a concrete guardrail resource path"]
      },
      {
        "condition": "Guardrails must match the platform path shape",
        "attribute_path": ["guardrails"],
        "values": ["projects/*/locations/*/apps/*/guardrails/*"],
        "policy_type": "element pattern whitelist"
      }
    ]
```

### Element Required

Requires an **array** attribute to **contain** every value in `values`. This is the
opposite direction to `whitelist`: a `whitelist` checks that every element present is
allowed, while `element required` checks that every required value is present. Extra
elements are fine. A single value (string, boolean or number) is checked as a one-item
list, so `values: [true]` means "must be true". Matching is exact, including
capitalisation, so write provider enum values exactly as the provider does.

The path is followed through **every element of every repeated block**: leave out the
list indexes to check them all, or give an index to check one. An **unset** attribute in
an element that exists counts as an empty list and is flagged. When a parent block is not
configured there is nothing to check. An empty `values` list, or a blank or
whitespace-padded entry, is refused: `get_multi_summary` returns `POLICY ERROR:` and
`policy_lint` reports [`invalid-element-required`](policy-lint.md#invalid-element-required).
```rego
    [
      {
        "situation_description": "A boot disk does not enable the guest OS features required for Shielded VM and Confidential VM support",
        "remedies": ["Add UEFI_COMPATIBLE and SEV_CAPABLE to disk.guest_os_features on every disk."]
      },
      {
        "condition": "Every disk's guest_os_features contains every required feature",
        "attribute_path": ["disk", "guest_os_features"],
        "values": ["UEFI_COMPATIBLE", "SEV_CAPABLE"],
        "policy_type": "element required"
      }
    ]
```
Because the path follows each element, a per-rule check needs no `"match"`. For example
`["rules", "action", "redirect", "https_redirect"]` with `values: [true]` flags every
configured redirect that does not force HTTPS, and routes without a redirect pass. The
violation message names each failing element and what it is missing. See the
[helper documentation](../../policies/_helpers/README.md#9-element-required) for the test command.

### Map Key Pattern Whitelist

Requires every **key of a map** to match one of the allowed wildcard shapes in
`values`. It is the allowlist counterpart to `map key blacklist`: use it when the good
keys share one known shape but the bad ones cannot be named in advance. Matching ignores
capitalisation, and each `*` matches one path segment, the same matcher as
`element pattern whitelist`. Every key is checked whatever its value, and the path is
followed through every element of every repeated block. A missing or empty map passes.
An empty `values` list or a blank shape is refused with `POLICY ERROR:`, and `policy_lint` reports
[`invalid-map-key-pattern-whitelist`](policy-lint.md#invalid-map-key-pattern-whitelist).
```rego
    [
      {
        "situation_description": "Resource Manager tags use ambiguous short-name keys instead of permanent tag key IDs",
        "remedies": ["Use permanent tag key IDs (tagKeys/<id>) as resource_manager_tags keys."]
      },
      {
        "condition": "Every resource_manager_tags key uses the permanent-ID form",
        "attribute_path": ["resource_manager_tags"],
        "values": ["tagKeys/*"],
        "policy_type": "map key pattern whitelist"
      }
    ]
```
Violation messages name the offending keys without printing their values. See the
[helper documentation](../../policies/_helpers/README.md#10-map-key-pattern-whitelist) for the test command.

### Presence

Checks whether an attribute or nested block is **set at all**, whatever its value.
`values` is exactly `["unset"]` (flag an element where it is set) or `["set"]` (flag an
element where it is not). Missing, `null`, `""`, `[]` and `{}` all count as unset, and an
absent nested block appears as `[]` in the plan, so `["unset"]` on a block path tells you
whether the block was configured. `false` and `0` count as set. The path is followed
through every element of every repeated block. Anything other than one of the two modes
is refused with `POLICY ERROR:`, and `policy_lint` reports
[`invalid-presence`](policy-lint.md#invalid-presence).

On a single element, `["unset"]` gives the same results as `whitelist [null, "", [], {}]`
and `["set"]` the same as `blacklist [null, "", [], {}]`. Use `presence` because it checks
every element and is harder to get wrong.
```rego
    [
      {
        "situation_description": "The instance template gives a network interface an external IP address",
        "remedies": ["Remove network_interface.access_config so instances have no external IP."]
      },
      {
        "condition": "No network interface configures access_config",
        "attribute_path": ["network_interface", "access_config"],
        "values": ["unset"],
        "policy_type": "presence"
      }
    ]
```
A template whose second interface has an external IP is flagged, with the message naming
`network_interface.[1].access_config`. See the
[helper documentation](../../policies/_helpers/README.md#11-presence) for the test command.

---

## Combining a situation's conditions: `"match"`

Everything above describes one **condition**. A **situation** is the group it lives in — the
metadata entry (`situation_description`, `remedies`) plus one or more conditions — and a policy
is a list of situations.

Situations are always **alternatives**: a resource is non-compliant if any situation flags it.
What `match` controls is how the conditions *inside* one situation combine.

| on the metadata entry | a resource is flagged when it fails | use it for |
|---|---|---|
| nothing, or `"match": "any"` | **any** condition in the situation | several ways the *same* argument can be wrong |
| `"match": "all"` | **every** condition in the situation | *alternatives* — several acceptable configurations |

`"any"` is the default, so a policy written before this key existed behaves exactly as it always
did. You only ever need to write `"all"` — but writing `"any"` explicitly is worth doing, and
`policy_lint` will
[ask you to](policy-lint.md#situation-match-unset) whenever a situation has two or more
conditions.

### When you need `"all"`

Some resources offer more than one acceptable way to do the right thing. A Vertex AI endpoint
can be kept off the public internet **either** by VPC peering (`network`) **or** by Private
Service Connect — you use one or the other, never both. Neither condition is wrong on its own,
and only an endpoint that does *neither* is actually exposed.

Under the default, each condition flags on its own and a perfectly good endpoint gets reported:

| endpoint | `network` set | PSC enabled | default (`any`) | `"match": "all"` |
|---|---|---|---|---|
| VPC peered | yes | no | flagged ❌ | passes ✅ |
| PSC only | no | yes | flagged ❌ | passes ✅ |
| neither | no | no | flagged ✅ | flagged ✅ |

```rego
    [
      {
        "situation_description": "Endpoint is reachable from the public internet",
        "remedies": [
          "Set network to a VPC path for peering, or enable Private Service Connect"
        ],
        "match": "all"
      },
      {
        "condition": "No VPC peering network is set",
        "attribute_path": ["network"],
        "values": [null, ""],
        "policy_type": "blacklist"
      },
      {
        "condition": "Private Service Connect is not enabled",
        "attribute_path": ["private_service_connect_config", 0, "enable_private_service_connect"],
        "values": [true],
        "policy_type": "whitelist"
      }
    ]
```

The same shape is how you make a check **conditional on a sibling argument** — "if `state` is
ACTIVE, then `action` must not be DELETE" is a situation whose two conditions are "state is
ACTIVE" and "action is DELETE", matched with `"all"`.

> **`"all"` fails quietly, so be deliberate about it.** If one of its conditions can never flag
> — a dead `pattern whitelist`, an `attribute_path` that does not exist — the intersection is
> empty and the whole situation reports "All passed" forever. That looks exactly like a
> compliant tree. Under the default a broken condition only costs you the coverage of that one
> condition; under `"all"` it costs you the situation. Test the nonCompliant fixture and check
> it is actually flagged.

Anything other than `"any"` or `"all"` is refused outright — the engine reports
`POLICY ERROR: unknown match ...` and checks nothing, rather than guessing.

<div align="center">

[⬅️ Previous: _vars.rego](vars-rego.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: Testing your policies ➡️](testing-policies.md#top) 

</div>
