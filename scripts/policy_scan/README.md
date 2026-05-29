# Local Policy Scan Script

## Overview

`policy_scan.py` is a helper script for running local Terraform plan generation and OPA/Rego policy checks before raising a pull request.

Instead of manually running long Terraform and `opa eval` commands, students can use one script to:

- check the branch name
- run the service linter
- generate or refresh `plan.json`
- scan policies with OPA
- show a clear success and failure summary

The script now runs Terraform plan generation for every selected policy, even when a `plan.json` file already exists. This helps make sure the scan uses the latest Terraform configuration.

---

## Basic Command Format

```bash
python policy_scan.py --provider <provider>
```

Example:

```bash
python policy_scan.py --provider gcp
```

This scans all services under the selected provider.

---

## Example Commands

### 1. Scan All Services for a Provider

```bash
python policy_scan.py --provider <provider>
```

Example:

```bash
python policy_scan.py --provider gcp
```

This scans all services, resources, and policies under the selected provider.

---

### 2. Scan One Service

```bash
python policy_scan.py --provider <provider> --service <service>
```

Example:

```bash
python policy_scan.py --provider gcp --service artifact_registry
```

This scans all resources and policies inside the selected service.

---

### 3. Scan One Resource Only

```bash
python policy_scan.py --provider <provider> --service <service> --resource <resource>
```

Example:

```bash
python policy_scan.py --provider gcp --service artifact_registry --resource google_artifact_registry_repository
```

This scans only the selected Terraform resource.

---

### 4. Scan One Specific Policy

```bash
python policy_scan.py --provider <provider> --service <service> --resource <resource> --policy <policy>
```

Example:

```bash
python policy_scan.py --provider gcp --service artifact_registry --resource google_artifact_registry_repository --policy approved_formats
```

This scans only one policy for the selected resource.

---

### 5. Show Policy Details Output

```bash
python policy_scan.py --provider gcp --service artifact_registry --details
```

This shows the policy `details` output instead of the message.

---

### 6. Change OPA Output Format

```bash
python policy_scan.py --provider gcp --service artifact_registry --format json
```

Supported formats are:

```text
pretty
json
raw
```

The default format is:

```text
pretty
```

---

### 7. Change Worker Counts

The script uses concurrent workers to speed up Terraform plan generation and OPA scans.

```bash
python policy_scan.py --provider gcp --service artifact_registry --terraform-workers 2 --opa-workers 4
```

Default values:

```text
Terraform workers : 2
OPA workers       : 4
```

Use lower worker counts if your computer becomes slow or if Terraform commands fail because too many tasks are running at the same time.

---

## What Happens When the Script Runs

When the script runs, it follows these steps:

1. Checks whether the branch name follows the project naming rule.
2. Runs the existing service linter.
3. Finds the selected provider, service, resource, and policy folders.
4. Runs Terraform commands for each selected policy folder:

   ```bash
   terraform init
   terraform plan --out=plan
   terraform show -json plan > plan.json
   ```

5. Regenerates `plan.json` even if it already exists.
6. Checks whether each policy has a matching `policy.rego` file.
7. Runs the OPA policy check using the generated `plan.json`.
8. Shows a final summary of successful policies and failed checks.

---

## Important Notes

`--provider` is required.

Correct:

```bash
python policy_scan.py --provider gcp
```

Incorrect:

```bash
python policy_scan.py
```

`--resource` cannot be used without `--service`, because resources are inside service folders.

Correct:

```bash
python policy_scan.py --provider gcp --service artifact_registry --resource google_artifact_registry_repository
```

Incorrect:

```bash
python policy_scan.py --provider gcp --resource google_artifact_registry_repository
```

`--policy` cannot be used without `--resource`, because policies are inside resource folders.

Correct:

```bash
python policy_scan.py --provider gcp --service artifact_registry --resource google_artifact_registry_repository --policy approved_formats
```

Incorrect:

```bash
python policy_scan.py --provider gcp --service artifact_registry --policy approved_formats
```

At the moment, the service linter only supports GCP. If another provider is used, the script skips the service linter.

---

## Available Flags

The script supports both full flag names and short-hand flags. Students can use either format.

| Purpose | Full flag | Short-hand flag | Example value |
|---|---|---|---|
| Select provider | `--provider` | `-p` | `gcp` |
| Select service | `--service` | `-s` | `artifact_registry` |
| Select resource | `--resource` | `-r` | `google_artifact_registry_repository` |
| Select policy | `--policy` | `-po` | `approved_formats` |
| Show message output | `--message` | `-m` | no value needed |
| Show details output | `--details` | `-d` | no value needed |
| Change OPA format | `--format` | `-f` | `pretty`, `json`, or `raw` |
| Set Terraform workers | `--terraform-workers` | no short-hand | `2` |
| Set OPA workers | `--opa-workers` | no short-hand | `4` |

Example using full flags:

```bash
python policy_scan.py --provider gcp --service artifact_registry --resource google_artifact_registry_repository --policy approved_formats --details --format pretty
```

Same command using short-hand flags:

```bash
python policy_scan.py -p gcp -s artifact_registry -r google_artifact_registry_repository -po approved_formats -d -f pretty
```

---

## Summary

`policy_scan.py` makes local policy testing easier and more consistent for students.

It checks the branch name, runs the service linter, regenerates Terraform `plan.json` files, runs OPA scans, and provides a final summary.
