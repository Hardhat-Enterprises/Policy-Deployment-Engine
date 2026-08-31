# Policy Helpers Framework

## Overview

The `_helpers` directory contains the core policy evaluation framework for the Policy Deployment Engine. This modular system evaluates Terraform plans against configurable security policies and returns structured violation reports.

**Key Features:**
- Modular architecture with specialized policy modules
- Support for 6 policy types: Blacklist, Whitelist, Range, Pattern Blacklist, Pattern Whitelist, Element Blacklist
- OR logic across the conditions of a situation (a resource is flagged if it fails **any** of them)
- Standardized interfaces across all policy modules
- Shared utility functions for common operations

**Version Compatibility:**
- OPA: 1.2.0
- Rego: v1

---

## Table of Contents

- [Architecture](#architecture)
  - [Directory Structure](#directory-structure)
  - [Component Responsibilities](#component-responsibilities)
- [Policy Types](#policy-types)
  - [1. Blacklist](#1-blacklist)
  - [2. Whitelist](#2-whitelist)
  - [3. Range](#3-range)
  - [4. Pattern Blacklist](#4-pattern-blacklist)
  - [5. Pattern Whitelist](#5-pattern-whitelist)
  - [6. Element Blacklist](#6-element-blacklist)
- [Usage Guide](#usage-guide)
  - [Input Format](#input-format)
  - [Multi-Condition Example (OR Logic)](#multi-condition-example-or-logic)
  - [Output Format](#output-format)
- [Testing](#testing)
  - [Quick Smoke Tests](#quick-smoke-tests)
  - [Detailed Verification](#detailed-verification)
  - [Individual Policy Tests](#individual-policy-tests)
  - [Creating Test Inputs](#creating-test-inputs)
- [Adding New Policy Types](#adding-new-policy-types)
  - [Step 1: Create Policy Module](#step-1-create-policy-module)
  - [Step 2: Update helpers.rego](#step-2-update-helpersrego)
  - [Step 3: Create Tests](#step-3-create-tests)
  - [Step 4: Document](#step-4-document)
- [Design Principles](#design-principles)
  - [1. Standardized Interfaces](#1-standardized-interfaces)
  - [2. Separation of Concerns](#2-separation-of-concerns)
  - [3. Encapsulation](#3-encapsulation)
  - [4. Defensive Programming](#4-defensive-programming)
  - [5. No Circular Dependencies](#5-no-circular-dependencies)
- [Common Patterns](#common-patterns)
  - [Accessing Resource Attributes](#accessing-resource-attributes)
  - [Formatting Paths](#formatting-paths)
  - [Array Normalization](#array-normalization)
  - [Set Comprehensions](#set-comprehensions)
- [Troubleshooting](#troubleshooting)
  - [Issue: Policy not detecting violations](#issue-policy-not-detecting-violations)
  - [Issue: "resource attribute not found" error](#issue-resource-attribute-not-found-error)
  - [Issue: Empty results when violations expected](#issue-empty-results-when-violations-expected)
  - [Issue: Pattern matching not working](#issue-pattern-matching-not-working)
- [Performance Considerations](#performance-considerations)
  - [Set Operations](#set-operations)
  - [Resource Filtering](#resource-filtering)
  - [Avoid Over-fetching](#avoid-over-fetching)
- [Migration Notes](#migration-notes)
- [Contributing](#contributing)
  - [Before Submitting Changes](#before-submitting-changes)
  - [Code Style](#code-style)
  - [Adding Examples](#adding-examples)

---

## Architecture

### Directory Structure

```
policies/_helpers/
├── README.md                           # This file
├── PLAN.md                             # Detailed refactoring plan and migration guide
├── helpers.rego                        # Main orchestration layer
├── shared.rego                         # Shared utility functions
└── policies/                           # Policy-specific modules
    ├── blacklist.rego
    ├── whitelist.rego
    ├── range.rego
    ├── pattern_blacklist.rego
    ├── pattern_whitelist.rego
    └── element_blacklist.rego
```

### Component Responsibilities

#### **helpers.rego** - Orchestration Layer
- **Package:** `terraform.helpers`
- **Role:** Main entry point and coordinator
- **Responsibilities:**
  - Aggregate policy results across multiple conditions
  - Route evaluation to appropriate policy modules
  - Union the violations of a situation's conditions (a resource failing **any** condition is non-compliant)
  - Format summary output for end users

**Key Functions:**
- `get_multi_summary(conditions, tf_variables)` - Main entry point
- `select_policy_logic(...)` - Routes to correct policy module
- `set_intersection_all(sets)` - Set intersection. `find_failing_resources` only ever passes it **one** set (the union of every condition's violations), so the cross-condition semantics is OR

#### **shared.rego** - Utility Library
- **Package:** `terraform.helpers.shared`
- **Role:** Shared functions used by all modules
- **Responsibilities:**
  - Resource attribute extraction
  - Attribute path formatting
  - Data normalization
  - Empty value handling
  - Pattern matching utilities

**No imports** - Designed to avoid circular dependencies

**Key Functions:**
- `get_resource_attribute(resource, key)` - Extract resource attributes safely
- `format_attribute_path(path)` - Convert paths to readable strings
- `ensure_array(values)` - Normalize to array format
- `get_target_list(resource, path, pattern)` - Extract wildcard matches

#### **policies/*.rego** - Policy Modules
- **Packages:** `terraform.helpers.policies.<policy_type>`
- **Role:** Implement specific policy evaluation logic
- **Responsibilities:**
  - Detect violations for their specific policy type
  - Generate formatted violation messages
  - Filter resources based on policy constraints

**All modules follow the same interface:**
```rego
get_violations(tf_variables, attribute_path, values) = results
```

---

## Policy Types

### 1. Blacklist
**Module:** `policies/blacklist.rego`  
**Use Case:** Forbid specific values

**Logic:**
- Scalar values: Direct match = violation
- Arrays: ANY element matching = violation (OR logic)
- Special: Empty array `[]` can be explicitly blacklisted

**Example:**
```json
{
  "policy_type": "Blacklist",
  "attribute_path": "enable_private_nodes",
  "values": [false]
}
```

### 2. Whitelist
**Module:** `policies/whitelist.rego`  
**Use Case:** Allow only specific values

**Logic:**
- Scalar values: Not in allowed list = violation
- Arrays: ALL elements must be allowed (AND logic)

**Example:**
```json
{
  "policy_type": "Whitelist",
  "attribute_path": "config_encryption_type",
  "values": ["CMEK"]
}
```

### 3. Range
**Module:** `policies/range.rego`  
**Use Case:** Enforce numeric bounds

**Logic:**
- Value must be between lower and upper bound (inclusive)
- Requires exactly 2 values: `[lower, upper]`

**Example:**
```json
{
  "policy_type": "Range",
  "attribute_path": "retention_period",
  "values": [2592000, 31536000]
}
```

### 4. Pattern Blacklist
**Module:** `policies/pattern_blacklist.rego`  
**Use Case:** Forbid patterns with wildcard matching

**Logic:**
- Extract substrings using `*` wildcards in target pattern
- Check each position against position-specific blacklists
- ANY match = violation (OR logic)

**Example:**
```json
{
  "policy_type": "Pattern Blacklist",
  "attribute_path": "name",
  "values": [
    "projects/*/locations/*",
    [["test-project"], ["us-east1", "europe-west1"]]
  ]
}
```

### 5. Pattern Whitelist
**Module:** `policies/pattern_whitelist.rego`  
**Use Case:** Allow only specific patterns with wildcard matching

**Logic:**
- Extract substrings using `*` wildcards in target pattern
- Check each position against position-specific whitelists
- ANY non-match = violation

**Example:**
```json
{
  "policy_type": "Pattern Whitelist",
  "attribute_path": "project_id",
  "values": [
    "projects/*",
    [["prod-", "staging-"]]
  ]
}
```

### 6. Element Blacklist
**Module:** `policies/element_blacklist.rego`  
**Use Case:** Forbid array elements containing substrings

**Logic:**
- Array attribute must be checked
- ANY element containing ANY pattern = violation
- Uses simple substring matching (`contains`)

**Example:**
```json
{
  "policy_type": "Element Blacklist",
  "attribute_path": ["status", 0, "restricted_services"],
  "values": ["*", "0.0.0.0"]
}
```

---

## Usage Guide

### Input Format

**tf_variables:**
```json
{
  "resource_type": "google_storage_bucket",
  "friendly_resource_name": "Storage Bucket",
  "resource_value_name": "name"
}
```

**conditions:** Array of situation objects
```json
[
  {
    "situation_description": "Buckets must use CMEK encryption",
    "remedies": ["Enable CMEK encryption", "Configure encryption key"],
    "condition": "Encryption configuration",
    "policy_type": "Whitelist",
    "attribute_path": "encryption_type",
    "values": ["CUSTOMER_MANAGED_ENCRYPTION"]
  }
]
```

### Multi-Condition Example (OR Logic)

A resource is non-compliant if it violates **any** condition in the situation. The
conditions' violations are unioned, not intersected:

```rego
conditions := [
  {
    "situation_description": "Production buckets require strict settings",
    "remedies": ["Update configuration"],
    
    # Condition 1: Name must start with "prod-"
    "condition": "Production naming",
    "policy_type": "Pattern Whitelist",
    "attribute_path": "name",
    "values": ["prod-*", [["prod-"]]]
  },
  {
    # Condition 2: Must use CMEK
    "condition": "Encryption type",
    "policy_type": "Whitelist",
    "attribute_path": "encryption_type",
    "values": ["CMEK"]
  }
]
```

Buckets that EITHER:
1. Don't match the "prod-*" pattern, OR
2. Don't use CMEK encryption

...will be flagged as non-compliant. A bucket that is named correctly but skips CMEK
is still flagged, and so is one that uses CMEK under the wrong name.

> **Why OR and not AND.** Each condition in a situation is one of the ways the argument
> can be wrong, so flagging on any of them over-flags — visible in a test run, and
> fixed. AND would under-flag: a resource that trips one check and passes another would
> come back compliant, and the policy would silently stop catching what it was written
> to catch. The behaviour is deliberate; see the note on `find_failing_resources` in
> `helpers.rego` before changing it.

### Output Format

```json
{
  "message": [
    "Total Storage Bucket detected: 5",
    [
      "Situation 1: Buckets must use CMEK encryption",
      "Non-Compliant Resources: my-bucket-1, my-bucket-2",
      "Potential Remedies: Enable CMEK encryption, Configure encryption key"
    ]
  ],
  "details": [
    {
      "situation": "Buckets must use CMEK encryption",
      "remedies": ["Enable CMEK encryption", "Configure encryption key"],
      "non_compliant_resources": ["my-bucket-1", "my-bucket-2"],
      "conditions": [
        {
          "Encryption configuration": [
            {
              "name": "my-bucket-1",
              "message": "Storage Bucket 'my-bucket-1' has 'encryption_type' set to 'GOOGLE_DEFAULT_ENCRYPTION'. It should be set to '[\"CUSTOMER_MANAGED_ENCRYPTION\"]'"
            }
          ]
        }
      ]
    }
  ]
}
```

---

## Testing

### Quick Smoke Tests

Run all policy types with pass/fail output:

```bash
cd /path/to/Policy-Deployment-Engine
./tests/smoke_test_helpers.sh
```

### Detailed Verification

View full output for debugging:

```bash
./tests/verify_helpers.sh
```

### Individual Policy Tests

Test specific policy modules:

```bash
# Blacklist test
opa eval --data ./policies/_helpers --data ./policies/gcp \
  --input ./inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_service_perimeter/status/plan.json \
  "data.terraform.gcp.security.access_context_manager_vpc_service_controls.access_context_manager_service_perimeter.status.message" \
  --format pretty

# Whitelist test
opa eval --data ./policies/_helpers --data ./policies/gcp \
  --input ./inputs/gcp/api_hub/google_apihub_api_hub_instance/config_encryption_type/plan.json \
  "data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_encryption_type.message" \
  --format pretty

# Range test
opa eval --data ./policies/_helpers --data ./policies/gcp \
  --input ./inputs/gcp/cloud_storage/google_storage_bucket/retention_period/plan.json \
  "data.terraform.gcp.security.cloud_storage.google_storage_bucket.message" \
  --format pretty
```

### Creating Test Inputs

Generate Terraform plan JSON for testing:

```bash
terraform plan --out=plan
terraform show -json plan | cat > plan.json
```

---

## Adding New Policy Types

### Step 1: Create Policy Module

Create `policies/<policy_type>.rego`:

```rego
package terraform.helpers.policies.<policy_type>

import data.terraform.helpers.shared

# Public API - must match this signature
get_violations(tf_variables, attribute_path, values) = results if {
    nc_resources := _get_resources(tf_variables.resource_type, attribute_path, values)
    results := {
        _build_violation(tf_variables, attribute_path, values, resource) |
        some resource in nc_resources
    }
}

# Private helper - filter non-compliant resources
_get_resources(resource_type, attribute_path, values) = resources if {
    resources := {
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        # Your policy logic here
    }
}

# Private helper - format violation message
_build_violation(tf_variables, attribute_path, values, resource) = violation if {
    violation := {
        "name": shared.get_resource_attribute(resource, tf_variables.resource_value_name),
        "message": _format_message(...)
    }
}

_format_message(...) = msg if {
    msg := sprintf("...", [...])
}
```

### Step 2: Update helpers.rego

Add import:
```rego
import data.terraform.helpers.policies.<policy_type>
```

Add routing rule:
```rego
select_policy_logic(tf_variables, attribute_path, values_formatted, "<policy_type>") = results if {
    results := <policy_type>.get_violations(tf_variables, attribute_path, values_formatted)
}
```

### Step 3: Create Tests

Create test files following the pattern in `tests/_helpers/`.

### Step 4: Document

Update this README with:
- Policy type description
- Logic explanation
- Example usage

---

## Design Principles

### 1. Standardized Interfaces
All policy modules export the same public API:
```rego
get_violations(tf_variables, attribute_path, values) = results
```

This consistency enables:
- Easy addition of new policy types
- Predictable behavior
- Simple orchestration logic

### 2. Separation of Concerns
- **helpers.rego** - Orchestration only, no policy logic
- **shared.rego** - Pure utility functions, no policy decisions
- **policies/*.rego** - Self-contained policy implementations

### 3. Encapsulation
- Public functions: `get_violations()`
- Private functions: `_prefixed_with_underscore()`
- No cross-module dependencies between policy modules

### 4. Defensive Programming
- Null-safe attribute access via `object.get(resource.values, path, null)`
- Type checking before operations
- Fallback values for missing data

### 5. No Circular Dependencies
`shared.rego` has no imports to ensure it can be imported by all modules without circular dependency issues.

---

## Common Patterns

### Accessing Resource Attributes

```rego
# Safe with fallback
attribute_value := shared.get_attribute_value(resource, attribute_path)

# Get resource identifier
resource_name := shared.get_resource_attribute(resource, tf_variables.resource_value_name)
```

### Formatting Paths

```rego
# ["status", 0, "restricted_services"] → "status.[0].restricted_services"
path_string := shared.format_attribute_path(attribute_path)
```

### Array Normalization

```rego
# Ensure value is array (handles both single values and arrays)
values_array := shared.ensure_array(values)
```

### Set Comprehensions

```rego
# Build set of non-compliant resources
nc_resources := {
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    # violation condition here
}
```

---

## Troubleshooting

### Issue: Policy not detecting violations

**Check:**
1. Is the `resource_type` correct in tf_variables?
2. Does the `attribute_path` match the actual resource structure?
3. Is the policy type string exactly correct (case-sensitive)?
4. Run with `--explain full` to see evaluation trace

**Debug command:**
```bash
opa eval --explain full --data ./policies/_helpers --data ./policies/gcp \
  --input ./inputs/gcp/.../plan.json \
  "data.terraform.gcp.security..." \
  --format pretty
```

### Issue: "resource attribute not found" error

**Cause:** The `resource_value_name` doesn't match the actual attribute in the resource.

**Solution:**
1. Check the Terraform plan JSON structure
2. Common values: `"name"`, `"id"`, `"bucket"`, `"project"`
3. Update `resource_value_name` in tf_variables

### Issue: Empty results when violations expected

**Check:**
1. Is `--data ./policies/_helpers` included in the opa eval command?
2. Is the input JSON correctly formatted?
3. Are resources in `planned_values.root_module.resources`?

### Issue: Pattern matching not working

**For Pattern Whitelist/Blacklist:**
1. Verify target pattern has `*` wildcards
2. Ensure patterns array has one sub-array per wildcard
3. Check that attribute value matches target pattern structure

---

## Performance Considerations

### Set Operations
The framework builds each situation's violations as a single set comprehension, so no
per-condition intersection pass is needed:
```rego
# One set holding every condition's violations (OR logic); set_intersection_all
# receives exactly one set and returns it unchanged.
failing_resources := set_intersection_all(resource_sets)
```

### Resource Filtering
Policy modules use set comprehensions for parallel evaluation:
```rego
resources := {
    resource |
    resource := input.planned_values.root_module.resources[_]
    # filters applied in parallel
}
```

### Avoid Over-fetching
- Don't load full resource objects when only checking one attribute
- Use `object.get()` for safe, efficient attribute access

---

## Migration Notes

This framework was refactored from a monolithic `helpers.rego` into modular components. See `PLAN.md` for:
- Detailed migration checklist
- Rationale for architectural decisions
- Step-by-step refactoring guide

**Key Changes:**
- Policy logic moved from helpers.rego to individual modules
- Shared utilities centralized in shared.rego
- Standardized interface across all policy types
- Improved testability and maintainability

---

## Contributing

### Before Submitting Changes

1. **Run tests:** Ensure all smoke tests pass
   ```bash
   ./tests/smoke_test_helpers.sh
   ```

2. **Test your specific changes:** Run relevant individual policy tests

3. **Update documentation:** Add examples and update this README if adding features

4. **Follow naming conventions:**
   - Public functions: `get_violations()`, `format_message()`
   - Private functions: `_get_resources()`, `_build_violation()`

### Code Style

- Use descriptive variable names
- Add comments for complex logic
- Include function docstrings explaining parameters and return values
- Keep functions focused and single-purpose

### Adding Examples

When adding new policy types or features, include:
1. Description of the use case
2. Example policy JSON
3. Expected behavior explanation
4. Test case with sample input/output

---

**Last Updated:** December 2025
