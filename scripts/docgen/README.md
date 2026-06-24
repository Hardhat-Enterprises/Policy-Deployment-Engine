# docgen — GCP resource docs generator (writes to `docs/`)

Generates one JSON file per Terraform resource type, enumerating every argument so
policy authors know what they can write security policies against. This is a rewrite of
`docgen` with a corrected output contract; it writes to `docs/` and leaves the
existing `docs/` tree untouched.

> Status: **GCP only.** AWS/Azure use different prefixes/grouping and are deferred.

## What's different from docgen

- **Source of truth = the provider _schema_, not markdown.** Arguments (description,
  `required`, `type`, and the full nested block structure) come from
  `terraform/tofu providers schema -json`. Markdown is used for two things only: the
  verbatim service-folder name (front matter `subcategory`), and a **description
  fallback** for the auto-generated IAM resources, whose schema descriptions come back
  blank (see `lib/descriptions.py`). This is why `type` is always populated and nesting
  is exact.
- **Verbatim names.** Folder = the `subcategory` exactly (`Cloud Storage`, spaces kept).
  File = the full resource type (`google_storage_bucket.json`, prefix kept).
- **Flat dotted-key arguments.** Nested arguments are flat keys like
  `lifecycle_rule.action.type` (a block is `lifecycle_rule`, its children are
  `lifecycle_rule.*`), so repeated leaf names never collide.

## Output schema

Exactly three top-level keys, in order:

```json
{
  "last_updated": "2026-06-23T02:05:51Z",
  "provider_version": "7.37.0",
  "arguments": {
    "location":             { "description": "...", "required": true, "type": "string",
                              "security_impact": "true/false", "rationale": "" },
    "retention_policy":     { "type": "block", "description": "...", "required": false },
    "retention_policy.is_locked": { "description": "...", "required": false, "type": "bool",
                              "security_impact": "true/false", "rationale": "" }
  }
}
```

- **Leaf** arg: `description`, `required`, `type`, `security_impact` (default `"true/false"`),
  `rationale` (default `""`). `security_impact` and `rationale` are filled in by hand.
- **Block** arg: `type: "block"`, `description`, `required` (no security fields).
- Excluded: read-only/computed-only attributes, and the `id` / `timeouts` meta-arguments.

## Requirements

- `terraform` **or** `tofu` (OpenTofu) on `PATH` — used to download the provider plugin
  and dump its schema. (CI already installs Terraform.)
- `git` — to sparse-clone the provider markdown for service grouping.
- Network access on first run (provider plugin + markdown). Both are cached afterwards.

## Usage

```bash
# Temporary test mode — only 2 services (Cloud Storage + BigQuery), to eyeball output
uv run python scripts/docgen/generator.py --csp gcp --mode identify-new --test

# Add docs for any brand-new resources/services; never touch existing files
uv run python scripts/docgen/generator.py --csp gcp --mode identify-new

# Refresh existing files: prune dropped args, add new args, keep human security fields
uv run python scripts/docgen/generator.py --csp gcp --mode refresh-existing

# Limit to specific services (verbatim or fuzzy); pin a provider version
uv run python scripts/docgen/generator.py --csp gcp --mode refresh-existing \
    --service "Cloud Storage" "BigQuery" --provider-version 7.37.0
```

### Re-run modes

- `--mode identify-new` — creates files that don't exist yet and **skips existing files
  untouched**. Running it after a provider bump only adds the newly-introduced
  resources; older files keep their previously pinned `provider_version`.
- `--mode refresh-existing` — operates on **existing files only**: recomputes arguments
  from the schema, **prunes** dotted keys the provider removed, **adds** new ones, and
  **preserves** contributor-authored `security_impact` (≠ `"true/false"`) and `rationale`
  (≠ `""`) matched by dotted key. Bumps `last_updated` and `provider_version`. Does not
  create new resource files.

## Layout

```
scripts/docgen/
  generator.py            # CLI + orchestration + the two re-run modes
  lib/
    schema_source.py      # terraform/tofu init + `providers schema -json` (cached)
    service_map.py        # resource -> verbatim subcategory (reuses docgen clone)
    arg_flatten.py        # schema block -> flat dotted-key arguments dict
    descriptions.py       # markdown description fallback (fills blank IAM descriptions)
    file_writer.py        # 3-key JSON write + refresh merge
  .cache/                 # gitignored: schema JSON cache + terraform work dir
```

Reuses from `scripts/docgen/lib/`: `repository_manager` (sparse clone + version
detection), `parser.extract_subcategory_from_frontmatter`, `errors`, `logging_config`.

## Tests

```bash
uv run --extra dev pytest tests/docgen/ -q
```

Covers the flattener (leaf/block shapes, dotted nesting, computed/meta exclusion, object
expansion) and the writer (key order, refresh preserve/prune). These are offline; the
schema fetch and clone are exercised by running `--test`.
