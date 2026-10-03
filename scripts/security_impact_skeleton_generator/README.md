# Security Impact Skeleton Generator

## Overview

The Security Impact Skeleton Generator is a PDE development utility that automatically creates the required policy and Terraform fixture skeletons for resource arguments marked with:

```json
"security_impact": true
```

in the resource documentation JSON.

The purpose of this tool is to reduce repetitive setup work for PDE contributors while keeping all security decisions and policy logic under contributor control.

## What the tool does

For a selected PDE resource, the generator:

- Reads the resource JSON from `docs/`.
- Finds all leaf arguments where `security_impact` is `true`.
- Checks whether the required PDE files already exist.
- Creates missing Terraform fixture files.
- Creates missing Rego policy files.
- Creates `_vars.rego` once per resource.
- Replaces structural template placeholders automatically.
- Uses the existing PDE `service_slug()` helper for Rego package naming.
- Never overwrites existing contributor files.

## What the tool does not do

The generator does not:

- Decide whether an argument should have security impact.
- Write security policy logic.
- Choose compliant or non-compliant values.
- Choose policy types.
- Automatically complete `friendly_resource_name`.
- Automatically choose `resource_value_name`.
- Generate Terraform plan cache files.

These decisions remain the responsibility of the PDE contributor.

## Usage

Run the script from the repository root.

### Inspect a resource

```bash
python3 scripts/security_impact_skeleton_generator/main.py \
"gcp/Cloud IAM/google_iam_workforce_pool_provider"
```

This displays all security-impacting arguments and shows whether their required skeleton files already exist.

### Generate missing skeleton files

```bash
python3 scripts/security_impact_skeleton_generator/main.py \
"gcp/Cloud IAM/google_iam_workforce_pool_provider" \
--generate
```

Existing files are skipped and are never overwritten.

## Generated structure

For a security-impact argument such as:

```text
attribute_condition
```

the generator creates:

```text
inputs/gcp/<Service>/<resource>/attribute_condition/
├── compliant.tf
├── config.tf
└── nonCompliant.tf
```

and:

```text
policies/gcp/<Service>/<resource>/
├── _vars.rego
└── attribute_condition.rego
```

Nested arguments are also supported.

For example:

```text
oidc.web_sso_config.response_type
```

is used directly as the fixture folder name and policy filename.

## Template rendering

The generator automatically replaces structural placeholders such as:

```text
<service>
<resource_type>
<policy_name>
RESOURCE_TYPE
```

using information from the selected resource.

For example, the service:

```text
Cloud IAM
```

is converted to:

```text
cloud_iam
```

for Rego package paths.

The generator also automatically fills the Terraform resource type in generated fixture files and in `_vars.rego`.

## Safety

The generator never overwrites an existing file.

If a contributor has already started or completed a policy or fixture, that file is skipped.

This means the generator can safely be run multiple times on the same resource.

## Testing

Automated tests are located in:

```text
scripts/security_impact_skeleton_generator/_tests/
```

Run them with:

```bash
python -m pytest \
scripts/security_impact_skeleton_generator/_tests/test_main.py \
-v
```

The automated tests cover:

- Valid target parsing.
- Invalid target handling.
- Security-impact argument detection.
- Nested argument detection.
- Service slug conversion.
- PDE path generation.
- Template placeholder replacement.
- No-overwrite behaviour.

## Example

Running:

```bash
python3 scripts/security_impact_skeleton_generator/main.py \
"gcp/Cloud IAM/google_iam_workforce_pool_provider"
```

may produce output similar to:

```text
PDE Security Impact Skeleton Generator
==================================================
Cloud    : gcp
Service  : Cloud IAM
Resource : google_iam_workforce_pool_provider

Security-impacting leaf arguments: 5
==================================================

attribute_condition
-------------------
  [✓] compliant.tf
  [✓] nonCompliant.tf
  [✓] config.tf
  [✓] policy.rego
  [✓] _vars.rego
```

If files are missing, running with `--generate` creates only the missing skeleton files.

## Contributor workflow

After generating the skeleton files, the contributor should:

1. Complete the compliant Terraform fixture.
2. Complete the non-compliant Terraform fixture.
3. Review `config.tf`.
4. Complete `friendly_resource_name` and `resource_value_name` in `_vars.rego`.
5. Implement the Rego security policy logic.
6. Run the PDE testing workflow.
7. Review the generated Terraform plan files created by the testing workflow.

## Design goal

The generator automates repetitive project setup, not security decision-making.

It provides the correct PDE file structure and known resource information so contributors can focus on implementing and validating the actual security policy.
