<a id="top"></a>
## 🚀 General Workflow

### ✅ Example Workflow

1. Get assigned a service from PDE Leadership (e.g. `Cloud Functions`).  
2. Research the service and identify security-relevant arguments.  

3. Create the required folder structure. Note the two trees are **not** symmetrical:
   - `inputs/gcp/<Service>/<resource>/<attribute>/` — one folder **per attribute** (holds the fixtures)
   - `policies/gcp/<Service>/<resource>/` — the policy is a **flat file** `<attribute>.rego` here,
     plus a single `_vars.rego` for the whole resource (not a folder per attribute)

   `<Service>` is the docs-taxonomy folder name (e.g. `Cloud Functions`, with spaces);
   `<resource>` and `<attribute>` are the exact Terraform resource type and argument names.

4. Create and configure the fixtures (copy them from `templates/gcp`):
   - `compliant.tf` (compliant example)  
   - `nonCompliant.tf` (non-compliant example)  
   - `config.tf`  

5. (Optional, to discover the attribute path) Generate a Terraform plan and inspect it:

    terraform init  
    terraform plan --out=plan  
    terraform show -json plan > plan.json  

   You don't commit this `plan.json` — it is gitignored. The test harness writes the plan that
   *is* committed: a `<sha>.json` in the fixture's own directory, named for the hash of its
   `*.tf`.

6. Use the plan JSON to determine your attribute path.  

7. Write your:
   - `<attribute>.rego` (policy logic)  
   - `_vars.rego` (resource metadata — one per resource)  

8. Test your policy. The linter runs automatically via pre-commit, or run it directly:

    python3 scripts/linters/linter.py --platform gcp

   Then run the OPA test harness (it handles `terraform plan`, plan caching, and `opa eval`):

    python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource>"

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
  [Merge dev into your branch to catch up](common-errors.md#merge-dev-into-your-branch-to-catch-up--nothing-is-scanned-until-then)  


<div align="center">

[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;

</div>

