# local_scan.py Documentation

## Overview

`local_scan.py` provides a simple local policy scanning command for the Policy Deployment Engine. It allows developers to test OPA/Rego policies locally without manually writing long `opa eval` commands.

The script takes a provider/service path such as `gcp/artifact_registry`, derives the expected Git branch name, validates the current branch, discovers matching input and policy folders, validates the Terraform `plan.json`, and runs the selected OPA output query.

By default, the script evaluates the policy `message` output. Users can also request the `details` output when needed.

---

## Purpose

Currently, policy testing can require manually running commands such as:

```powershell
opa eval --data .\policies\<provider> --data .\policies\_helpers --input .\inputs\<provider>\<service>\<resource>\<policy/argument>\plan.json "data.terraform.<provider>.security.<service>.<resource>.<policy/agrument>.message" --format pretty
```

`local_scan.py` simplifies this by allowing commands like:

```powershell
python scripts\policy_scan\local_scan.py <provider>/<service>
```

This improves local testing consistency, reduces command mistakes, and makes the local scan process closer to the project’s automated policy checking workflow.

---

## Key Features

- Scans policies locally using a short provider/service command.
- Extracts provider and service from the service path.
- Derives the expected Git branch from provider and service.
- Validates that the user is on the correct Git branch before scanning.
- Supports service-level, resource-level, and policy-level scans.
- Uses `message` as the default output type.
- Supports `--details` for detailed policy output.
- Validates that matching `policy.rego` files exist.
- Validates that matching `plan.json` files exist.
- Checks that `plan.json` contains both compliant and non-compliant resources.
- Skips incomplete or invalid policy folders safely.
- Prints a scan summary showing scanned and skipped policies.

---

## Prerequisites

- Python 3.10+
- OPA CLI installed and available in `PATH`
- Git installed and available in `PATH`
- Existing project folder structure:

```text
inputs/<provider>/<service>/<resource>/<policy>/plan.json
policies/<provider>/<service>/<resource>/<policy>/policy.rego
policies/_helpers/
```

Example:

```text
inputs/gcp/artifact_registry/google_artifact_registry_repository/approved_formats/plan.json
policies/gcp/artifact_registry/google_artifact_registry_repository/approved_formats/policy.rego
```

---

## Usage

### Scan all resources and policies for a service

```powershell
python scripts\policy_scan\local_scan.py gcp/artifact_registry
```

This scans every resource and policy under:

```text
inputs/gcp/artifact_registry/
policies/gcp/artifact_registry/
```

---

### Scan all policies for a specific resource

```powershell
python scripts\policy_scan\local_scan.py gcp/artifact_registry --resource google_artifact_registry_repository
```

This scans all policies under:

```text
inputs/gcp/artifact_registry/google_artifact_registry_repository/
```

---

### Scan one specific policy

```powershell
python scripts\policy_scan\local_scan.py gcp/artifact_registry --resource google_artifact_registry_repository --policy approved_formats
```

This scans only:

```text
inputs/gcp/artifact_registry/google_artifact_registry_repository/approved_formats/plan.json
```

against:

```text
policies/gcp/artifact_registry/google_artifact_registry_repository/approved_formats/policy.rego
```

---

### Show details output instead of message

```powershell
python scripts\policy_scan\local_scan.py gcp/artifact_registry --resource google_artifact_registry_repository --policy approved_formats --details
```

By default, the script evaluates:

```text
message
```

With `--details`, it evaluates:

```text
details
```

---

## Command Line Arguments

| Argument | Required | Default | Description |
|---|---:|---|---|
| `service_path` | Yes | N/A | Provider and service path, for example `gcp/artifact_registry`. |
| `--resource` | No | All resources | Specific Terraform resource to scan. |
| `--policy` | No | All policies | Specific policy folder to scan. Must be used with `--resource`. |
| `--message` | No | Enabled by default | Shows policy message output. |
| `--details` | No | Off | Shows policy details output. |

---

## Branch Validation

The command uses a provider/service path:

```text
gcp/artifact_registry
```

The script derives the expected Git branch name as:

```text
gcp/service/artifact_registry
```

Before scanning, it checks the current Git branch using:

```powershell
git branch --show-current
```

If the current branch does not match the expected branch, the script stops.

Example error:

```text
Error: branch mismatch.
Current branch : gcp/service/api_gateway
Expected branch: gcp/service/artifact_registry
Please switch to the correct branch before running the local policy scan.
```

---

## Output Type Logic

If no output flag is provided, the script defaults to:

```text
message
```

Example:

```powershell
python scripts\policy_scan\local_scan.py gcp/artifact_registry
```

is equivalent to:

```powershell
python scripts\policy_scan\local_scan.py gcp/artifact_registry --message
```

To view detailed output, use:

```powershell
--details
```

`--message` and `--details` cannot be used together.

---

## Plan Resource Validation

For example, for this resource:

```text
google_artifact_registry_repository
```

the script expects:

```text
google_artifact_registry_repository.c
google_artifact_registry_repository.nc
```

The first resource must be the compliant example:

```text
<resource>.c
```

The second resource must be the non-compliant example:

```text
<resource>.nc
```

If the names are incorrect, the script skips that policy and prints a remedy.

---

## Troubleshooting

| Symptom | Likely Cause | Fix |
|---|---|---|
| `Error: branch mismatch` | Current Git branch does not match the expected service branch. | Switch to the correct branch, for example `gcp/service/artifact_registry`. |
| `service input directory not found` | The input folder for the provider/service does not exist. | Check the service path and folder structure under `inputs/`. |
| `policy input directory not found` | The selected policy folder does not exist under inputs. | Check the `--policy` name and ensure the input folder exists. |
| `policy.rego not found` | Matching policy file is missing. | Add or move `policy.rego` to the correct policy folder. |
| `plan.json not found` | Terraform plan output has not been generated. | Generate `plan.json` in the matching input folder. |
| `could not read plan.json using utf-16 encoding` | The file encoding does not match the script’s expected encoding. | Regenerate `plan.json` using the expected UTF-16 encoding or update the script encoding. |
| `compliant resource name is incorrect` | First resource in `plan.json` is not named `<resource>.c`. | Rename the compliant Terraform resource block to `c` and regenerate `plan.json`. |
| `non-compliant resource name is incorrect` | Second resource in `plan.json` is not named `<resource>.nc`. | Rename the non-compliant Terraform resource block to `nc` and regenerate `plan.json`. |

---

## Summary

`local_scan.py` helps developers test OPA policies locally with a simple and consistent command. It removes the need to manually write long OPA queries, validates the current Git branch, checks required files, verifies Terraform resource naming conventions, and runs the correct `message` or `details` policy output.
