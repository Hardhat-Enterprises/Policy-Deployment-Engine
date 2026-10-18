<a id="top"></a>
## 🚀 General Workflow

### ✅ Example Workflow

1. Get assigned a service from PDE Leadership (e.g. `Cloud Functions`).  
2. Research the service and identify security-relevant arguments.  

3. After layout cutover, create one `policies/gcp/<Service>/<resource>/<attribute>/`
   directory containing `policy.rego` and the fixtures. Keep one `_vars.rego` in
   `policies/gcp/<Service>/<resource>/` for the whole resource.

   `<Service>` is the docs-taxonomy folder name (e.g. `Cloud Functions`, with spaces);
   `<resource>` and `<attribute>` are the exact Terraform resource type and argument names.

4. Create and configure the fixtures (copy them from `templates/gcp`):
   - `compliant.tf` (compliant example)  
   - `nonCompliant.tf` (non-compliant example)  
   - Inherit `policies/gcp/config.tf`, or supply a local `config.tf` that replaces it.

5. Generate and inspect the plan through the harness:

    python scripts/auto_test/auto_test.py "gcp/<Service>/<resource>"

   The harness assembles the effective configuration in a temporary workspace and
   writes the committed `<sha>.json` in the argument directory. Inspect that JSON
   to find your attribute path, then finish the policy and rerun the checks.

6. Use the plan JSON to determine your attribute path.  

7. Write your:
   - `<attribute>/policy.rego` (policy logic)
   - `_vars.rego` (resource metadata — one per resource)  

8. Check your work. One command runs everything CI will run — branch name, branch scope,
   lint, doc completeness, argument coverage, and the `terraform plan` + `opa eval` test:

    python3 scripts/check_resource.py

   If it says every check passed, CI will agree. See
   [Testing your policies](testing-policies.md#top) for what each check means and how to run
   the individual tools when you are chasing one failure.

9. Fix any errors and re-test until successful.  

10. Complete documentation in the resource's JSON at `docs/gcp/<Service>/<resource>.json`
   (one file per resource). Generate/refresh the JSON skeleton from the provider schema with:

    python3 scripts/docgen/generator.py --csp gcp --mode refresh-existing --service "<Service>"

   then fill in `security_impact` and `rationale` for each argument.

11. Commit and push your changes:

    git add .  
    git commit -m "your message"  
    git push origin <branch-name>  

12. Create a pull request and wait for review.

---

### ⚠️ Notes & Best Practices

- Follow naming conventions exactly (must match Terraform)  
- Each policy targets **one argument only**  
- Ensure all required Terraform arguments are included  
- Attribute paths must match the structure of `plan.json`  
- Always test before pushing  
- Documentation must be completed before raising a PR  
- If the portal stops scanning your branch and asks you to merge `dev` to catch up, do that **and**
  re-run the test harness — see
  [Merge dev into your branch to catch up](common-errors.md#harness-out-of-date)  


<div align="center">

[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;

</div>
