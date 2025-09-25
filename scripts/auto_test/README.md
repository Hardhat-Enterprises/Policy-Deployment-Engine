# auto_test.py Documentation

## Overview
`auto_test.py` automates end‑to‑end validation of Terraform example inputs against corresponding OPA (Open Policy Agent) Rego policies. For every Terraform leaf directory under an inputs root that has a matching directory under a policies root, it:
1. Generates a Terraform plan (JSON) locally (no backend).  
2. Evaluates policy queries via `opa eval` to obtain the target resource type and policy messages.  
3. Interprets the messages to determine pass/fail based on naming conventions (non‑compliant resources must be reported; compliant ones must be omitted).  
4. Prints a grouped summary by service and resource plus detailed failure reasons; exits non‑zero if any policy fails.

## Key Features
- Auto discovery of matching input/policy directory pairs.
- Terraform plan generation isolated per directory (no remote backend).
- Dynamic extraction of package and vars import metadata from `policy.rego` when present.
- OPA evaluation with robust JSON parsing and graceful fallbacks.
- Resource name coverage & correctness checks based on naming patterns (`c*` compliant, `nc*` non‑compliant).
- Clean hierarchical summary output (Service → Resource → Policy) with clear ✅ / ❌ indicators.

## Prerequisites
- Python 3.10+ (standard library only used).
- Terraform CLI available in `PATH`.
- OPA CLI available in `PATH`.
- Local directory structure mirroring `inputs/<cloud>/<service>/<resource>/<attribute>` and `policies/<cloud>/<service>/<resource>/<attribute>`.
- (GCP example) The script injects fake minimal Google provider credentials via env vars to allow plan creation without real secrets.

## Installation
No install needed; keep the script in `scripts/` and ensure dependencies (Terraform, OPA) are installed.

## Usage
```powershell
# Basic run (defaults to GCP paths)
python .\scripts\auto_test.py

# Verbose (shows OPA queries, Terraform diagnostics, matching logic)
python .\scripts\auto_test.py --verbose

# Custom roots
python .\scripts\auto_test.py --inputs inputs/gcp --policies policies/gcp
```

## Command Line Arguments
| Argument | Default | Description |
|----------|---------|-------------|
| `--inputs` | `inputs/gcp` | Root directory containing Terraform input trees. |
| `--policies` | `policies/gcp` | Root directory containing matching policy trees. |
| `--verbose` | off | Enables detailed logs (OPA queries, name matching, missing mentions). |

## Exit Codes
| Code | Meaning |
|------|---------|
| 0 | All matched policies passed. |
| 1 | One or more policies failed OR no matching pairs were found. |

## Output Format
Example (truncated):
```
Summary of policy checks:
Service: certificate_authority
  Resource: certificate_authority
    Policy: deletion_protection - ✅
    Policy: issuer_path_length - ❌

Failures:
Service: certificate_authority | Resource: certificate_authority | Policy: issuer_path_length Unmentioned resources other than 'c' found: nc1
```

## Policy Evaluation Logic
1. Determine resource type via `vars.variables.resource_type` (imported path if `policy.rego` declares it; fallback path if not).  
2. Collect resource names of that Terraform type from the plan root module.  
3. Retrieve `data.<package>.message` value(s).  
4. Treat listed resource names as *non‑compliant findings*.  
5. Fail if:
   - Any compliant name (`c*`) appears in output, or
   - Any non‑compliant name (`nc*`) is missing from output, or
   - Terraform / OPA queries fail, or no resources found.

## Naming Conventions
- `c`, `c1`, `c2`, ... : Compliant resources (must be omitted from policy output).  
- `nc`, `nc1`, `nc2`, ... : Non‑compliant resources (must be present in policy output).  

## Function Reference

### extract_path_parts(path)
Validates the input directory depth and extracts the last three path components as `service`, `resource`, and `attribute`. Exits the program if the path is malformed.

### make_failure(attribute, reason, service, resource)
Builds a standardized failure result dictionary including context (service, resource, policy) and an explanatory reason.

### make_success(attribute, service, resource)
Builds a standardized success result dictionary for a policy check with contextual metadata.

### opa_eval_value(policies_root, plan_json_path, query)
Invokes `opa eval` with the given data root and plan JSON input, parses the JSON output, and returns the first expression value or `None` on errors (printing diagnostics if OPA fails).

### get_unique_resource_names(plan_json_path, resource_type)
Parses the Terraform plan JSON to collect unique resource names of the specified type from the root module only, ignoring nested modules for precision.

### parse_rego_metadata(policy_dir)
Reads `policy.rego` (if present) to detect the `package` declaration and an import referencing a `vars` data path. Returns both to guide later query construction.

### match_names_in_messages(messages, candidate_names)
Performs safe regex boundary matching to identify which candidate Terraform resource names appear inside policy messages, avoiding substring false positives.

### get_resource_type(policies_root, plan_path, vars_resource_type_query)
Executes the OPA query that retrieves the declared Terraform resource type from the vars document, delegating to `opa_eval_value`.

### normalize_messages(messages_value)
Coerces the raw OPA message value (string, list, other) into a clean list of strings for uniform downstream processing.

### get_policy_messages(policies_root, plan_path, message_query)
Fetches the policy's `message` value(s) via OPA and normalizes them into a list of strings.

### run_terraform_commands(input_dir, verbose)
Runs Terraform `init`, `plan`, and `show -json` in the target directory with stubbed GCP environment variables. Returns the generated `plan.json` path or `None` if any command fails (optionally printing verbose output).

### get_policy_metadata(policy_dir, service, resource, attribute)
Constructs the OPA message and resource_type query paths, using parsed metadata if available; otherwise falls back to a deterministic package path template.

### log_messages(verbose, message_query, messages)
Conditionally prints the OPA message query and each returned message when verbose mode is enabled.

### validate_policy_output(attribute, resource_type, plan_path, messages, verbose, service, resource)
Core evaluation: gathers resource names, checks coverage and correctness against naming rules, logs diagnostics when verbose, and returns success or failure result structures.

### run_policy_check_pair(input_dir, policy_dir, policies_root, verbose)
Coordinates Terraform plan generation, OPA queries, message extraction, and validation for a single input/policy attribute directory, returning the standardized result.

### find_matching_pairs(inputs_root, policies_root)
Discovers leaf Terraform directories (those containing `.tf` files with no nested `.tf` descendants) and pairs each with a policy directory of the same relative path (if it exists).

### main()
Command-line entry point: parses arguments, finds matching pairs, aggregates results, prints grouped summaries, displays detailed failures, and sets the process exit code.

## Troubleshooting
| Symptom | Likely Cause | Fix |
|---------|--------------|-----|
| `OPA eval failed` | Missing OPA binary or invalid Rego/import path | Install OPA; verify package/import names. |
| `Terraform failed to compile!` | Invalid Terraform syntax or provider init issue | Fix Terraform config; ensure provider blocks valid. |
| `Could not find any resources!` | Vars query returned `None` | Check `vars.rego` and `resource_type` variable. |
| Messages empty | Policy not setting `message` | Ensure rule exports `message` with findings list. |
