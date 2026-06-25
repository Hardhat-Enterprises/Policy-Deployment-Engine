# Guide — Outstanding TODOs

Tracking work needed on the contributor guide under `Guide/Policy_writing_tutorial/`.

The **text** of the guide was reconciled with the post-consolidation repo (folder structure,
scripts, flags, workflow, policy types) and every link/image reference resolves. The items below
are things that could not be fixed from text alone — mostly **screenshots** whose *content* is
outdated (they still render; they just depict the old layout), plus a few content gaps.

Paths below are relative to `Guide/Policy_writing_tutorial/` unless noted.

---

## 1. Screenshots to re-capture — confirmed outdated

These were visually inspected and show pre-consolidation state. Re-capture against the current
repo.

| Image | Used in | What's stale → should show |
|---|---|---|
| `images/c.tf-nc.tf-file-structure.png` | policy-writing.md | `c.tf` / `nc.tf` → **`compliant.tf` / `nonCompliant.tf`**; service folder shown as slug `access_approval` → display name **`Access Approval`** |
| `images/policy-vars-file-structure.PNG` | policy-writing.md, vars-rego.md | `vars.rego` → **`_vars.rego`**; attributes shown as **folders** → flat **`<attribute>.rego`** files; slug folder → display name |
| `images/vars-rego.PNG` | vars-rego.md | tree shows `policy.rego` inside attribute folders → flat **`<attribute>.rego`**; slug `cloud_functions` → **`Cloud Functions`** (the package line in the shot is still correct) |
| `images/runtime-policy-gcp.png` | policy-writing.md | `policies/` attributes shown as **folders** → flat **`<attribute>.rego`**; slug `cloud_functions` → **`Cloud Functions`** |
| `images/runtime-example-inputs-policy.png` | policy-writing.md | slug `cloud_functions` → **`Cloud Functions`** (the inputs attribute-as-folder layout shown is still correct) |
| `images/resource-folders.PNG` | policy-writing.md | slug `cloud_functions` → display name **`Cloud Functions`** |
| `images/linters-output.PNG` | testing-policies.md | command `linter.py --gcp cloud_functions` → **`python3 scripts/linters/linter.py --platform gcp`** (the `--gcp` flag no longer exists) |
| `images/artifact_registry.PNG` | researching-and-documentation.md | `docs/gcp/<Service>/resource_json/` subfolder → **flat `docs/gcp/<Service>/<resource>.json`**; underscore names (`App_Engine`, `Artifact_Registry`) → display names with spaces (**`App Engine`**, **`Artifact Registry`**) |

## 2. Screenshots to review — possibly outdated (not fully verified)

| Image | Used in | Why review |
|---|---|---|
| `images/rego-package-name-top.PNG`, `images/rego-package-name-vars.PNG` | policy-rego.md | package naming is unchanged, but the surrounding file tree may still show `policy.rego`/`vars.rego` instead of `<attribute>.rego`/`_vars.rego` |
| `images/argument-reference.PNG` | researching-and-documentation.md | confirm the provider version in any visible URL is **7.37.0** |
| `images/terraform-OPA-check.PNG` | raising-pull-request.md | confirm the PR check names match the current per-resource CI gate |

## 3. New screenshot worth adding

- **`testing-policies.md` step 2** lost its screenshot when the manual `opa eval` flow was
  replaced by `auto_test.py`. Consider capturing a `python3 scripts/auto_test/auto_test.py
  "gcp/<Service>/<resource>"` run (pass + fail output) to illustrate it.

## 4. Unreferenced image files (cleanup candidates)

These live in `images/` but are not referenced by any guide page. Most are stale leftovers
(e.g. the old `opa-eval-*` shots dropped from the testing rewrite). Delete or re-wire as needed:

```
New-pull-request.PNG            access-terraform-registry.png   argument-reference_policy.png
create-pull-request.PNG         each-policy-policy-rego.PNG      email.png
finding-pushed-branch.PNG       inputs-gcp.PNG                   opa-eval-details-output.PNG
opa-eval-message-output.PNG     pde-logo.png                     plan into json.png
policy-gcp.PNG                   resource-according-to-terraform.PNG   title-comment.PNG
vars-package-example.PNG        researching-service-example.png.PNG
for-example-service-cloud-functions-resource-google-cloudfunctions-function.png
```

## 5. Content gaps / enhancements

- **`policy-rego.md`** documents 5 of the 6 helper policy types. `element blacklist` has now been
  added; if the helpers gain more types, keep this list in sync with
  `policies/_helpers/policies/`.
- Consider a worked example of a **nested (dotted) attribute** (e.g.
  `service_config.ingress_settings` on `google_cloudfunctions2_function`) — the guide mentions
  dotted keys but never walks one through end to end.

## 6. External links to verify (in `prerequisite.md`)

Org-internal links that may rot — confirm they still resolve and point at current material:

- The SharePoint **Upskilling Guide** links (Cloud/Terraform/OPA/PDE/Git sections).
- The **Contributor's Quiz** form link.
- The **Requirement Installation** demo video links (GCP/OPA/Terraform install).

## 7. Repo-side follow-up (outside the guide)

- Some real `_vars.rego` `friendly_resource_name` values look like placeholders (e.g.
  `"GC_functions_function"` in
  `policies/gcp/Cloud Functions/google_cloudfunctions_function_iam_member/_vars.rego`). Worth a
  cleanup pass in the `policies/` tree so they read as human-friendly names.
