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
- Uses the current PDE policy-folder layout.
- Uses the shared platform `config.tf`.
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
- Automatically generate a local `config.tf`.
- Generate Terraform plan JSON files.

These decisions remain the responsibility of the PDE contributor.

Terraform plans are generated and validated later through the normal PDE auto-test workflow.

## Current PDE layout

The generator follows the current PDE policy structure:

```text
policies/gcp/
├── config.tf
└── <Service>/
    └── <resource>/
        ├── _vars.rego
        └── <argument>/
            ├── policy.rego
            ├── compliant.tf
            ├── nonCompliant.tf
            ├── <fixture-sha>.json
            └── config.tf         # optional local override
```

The shared:

```text
policies/gcp/config.tf
```

is used by default.

A local `config.tf` should only be added when the policy requires resource-specific configuration that overrides the shared configuration.

## Usage

Run the script from the repository root.

### Inspect a resource

```bash
python3 scripts/security_impact_skeleton_generator/main.py \
"gcp/Cloud IAM/google_iam_workforce_pool_provider"
```

This displays all security-impacting arguments and shows whether their required files already exist.

### Generate missing skeleton files

```bash
python3 scripts/security_impact_skeleton_generator/main.py \
"gcp/Cloud IAM/google_iam_workforce_pool_provider" \
--generate
```

Existing files are skipped and are never overwritten.

The shared platform `config.tf` must already exist before skeleton files can be generated.

## Generated structure

For a security-impact argument such as:

```text
attribute_condition
```

the generator creates:

```text
policies/gcp/<Service>/<resource>/
├── _vars.rego
└── attribute_condition/
    ├── policy.rego
    ├── compliant.tf
    └── nonCompliant.tf
```

The generator does not create a local `config.tf` by default.

The policy inherits:

```text
policies/gcp/config.tf
```

unless a contributor later adds a policy-specific local override.

## Nested arguments

Nested arguments are supported.

For example:

```text
oidc.web_sso_config.response_type
```

is used directly as the argument folder name:

```text
policies/gcp/<Service>/<resource>/oidc.web_sso_config.response_type/
├── policy.rego
├── compliant.tf
└── nonCompliant.tf
```

This keeps the generated structure aligned with the documented Terraform argument name.

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

The service directory itself still uses the original PDE documentation taxonomy name:

```text
Cloud IAM
```

The generator also automatically fills the Terraform resource type in generated fixture files and in `_vars.rego`.

## Shared configuration

The current PDE layout uses one shared GCP Terraform configuration:

```text
policies/gcp/config.tf
```

The generator checks that this file exists before creating policy skeletons.

If the shared configuration is missing, generation stops and reports an error.

This protects the contributor from generating files against an incomplete or unmigrated repository layout.

## Safety

The generator never overwrites an existing file.

If a contributor has already started or completed a policy or fixture, that file is skipped.

This means the generator can safely be run multiple times on the same resource.

The generator also does not modify:

- Existing policy logic.
- Existing Terraform fixtures.
- Existing `_vars.rego`.
- Cached Terraform plan JSON files.
- Shared platform configuration.

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

The automated test suite currently contains 8 tests covering:

- Valid target parsing.
- Invalid target handling.
- Security-impact argument detection.
- Nested argument detection.
- Service slug conversion.
- PDE policy-folder path generation.
- Nested argument path generation.
- Template placeholder replacement.
- No-overwrite behaviour.

The test suite should complete with:

```text
8 passed
```

## Repository validation

After modifying the generator, run:

```bash
pre-commit run --all-files
```

The generator has been validated against the PDE repository checks, including:

- Policy / docs / inputs linter.
- Branch naming convention.
- Branch scope validation.
- Resource gate validation.

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
  [✓] policy.rego
  [✓] _vars.rego
  [✓] shared config.tf
```

If files are missing, running with `--generate` creates only the missing skeleton files.

If all files already exist, the generator reports that there is nothing to generate.

## Contributor workflow

After generating the skeleton files, the contributor should:

1. Complete the compliant Terraform fixture.
2. Complete the non-compliant Terraform fixture.
3. Complete `friendly_resource_name` and `resource_value_name` in `_vars.rego`.
4. Implement the Rego security policy logic.
5. Add a local `config.tf` only if the policy requires an override to the shared GCP configuration.
6. Run the PDE auto-test workflow.
7. Allow the auto-test workflow to generate or validate the `<fixture-sha>.json` Terraform plan.
8. Run repository validation before committing and raising a pull request.

## Design goal

The generator automates repetitive project setup, not security decision-making.

It provides the correct PDE file structure and known resource information so contributors can focus on implementing and validating the actual security policy.

The tool is intentionally limited to safe structural automation and leaves all security judgement, compliant values, remediation logic, and policy implementation decisions to the contributor.
