# Local Policy Scan Script

## Overview

`local_scan.py` is a helper script for running OPA policy checks locally before raising a pull request.

Instead of manually writing long `opa eval` commands, students can use one simple command format to scan policies for a selected cloud provider and service.

The script also runs the existing branch name checker and service linter before scanning policies. This helps reduce common mistakes such as wrong branch naming, incorrect resource naming, missing files, or policy structure issues.

---

## Basic Command Format

```bash
python scripts\policy_scan\local_scan.py <provider>/<service>
```

Example:

```bash
python scripts\policy_scan\local_scan.py gcp/artifact_registry
```

---

## Example Commands

### 1. Scan a Full Service

```bash
python scripts\policy_scan\local_scan.py <provider>/<service>
```

This scans all resources and policies inside the service.

---

### 2. Scan One Resource Only

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --resource <resource>
```

This scans only the selected Terraform resource.

---

### 3. Scan One Specific Policy

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --resource <resource> --policy <policy>
```

This scans only the policy for the selected resource.

---

### 4. Show Policy Message Output (Optional)

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --message
```

This shows the policy `message` output.

By default, the script shows `message`, so this flag is optional.

---

### 5. Show Policy Details Output

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --details
```

This shows the policy `details` output instead of the message.

---

### 6. Change Output Format

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --format json
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

## What Happens When the script is run

When the script runs, it follows these steps:

1. Checks whether the branch name follows the project naming rule.
2. Runs the existing service linter.
3. Finds the selected service folder inside the `inputs` directory.
4. Looks for resource folders and policy folders.
5. Checks whether each policy has:
   - a `policy.rego` file
   - a matching `plan.json` file
6. Runs the OPA policy check.
7. Shows a final summary of scanned and skipped policies.

---

## Important Notes

The service path must follow this format:

```text
<provider>/<service_name>
```

Correct example:

```bash
python scripts\policy_scan\local_scan.py gcp/artifact_registry
```

Incorrect example:

```bash
python scripts\policy_scan\local_scan.py artifact_registry
```

At the moment, the service linter only supports GCP. If another provider is used, the script will skip the service linter.

Also, `--policy` cannot be used alone. A policy belongs inside a resource folder, so `--resource` must be provided first.

Correct:

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --resource <resource> --policy <policy>
```

Incorrect:

```bash
python scripts\policy_scan\local_scan.py <provider>/<service> --policy <policy>
```

---

## Final Output

At the end, the script shows a summary like this:

```text
Local policy scan completed
Scanned policies : 3
Skipped policies : 1
```

A policy may be skipped if the script cannot find the required `policy.rego` or `plan.json` file.

---

## Summary

`local_scan.py` makes local policy testing easier and more consistent for students.

It allows students to scan policies, check branch naming, run the service linter, and prepare their work before raising a pull request.
