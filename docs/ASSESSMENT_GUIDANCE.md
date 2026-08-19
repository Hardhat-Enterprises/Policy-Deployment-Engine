# Assessment Guidance: How to Think About `security_impact`

How to decide an argument's `security_impact` (`true`/`false`) and write its `rationale`
in the `docs/` resource files — and how to review student PRs that do the same.

> `security_impact: true` means **"this argument is worth a platform-level security
> policy"** — a generic rule that constrains its value to make the resource more secure.
> `false` means it is not a useful policy target. The goal is to build a large library of
> _optional_ policies an enterprise client may choose to adopt — so we add a policy
> wherever enforcing it would make the resource more secure, and skip it otherwise.

---

## 1. The mission

We are building a library of **generic, platform-level security policies** for an
imaginary multi-tenant enterprise: many teams, hundreds of projects, and — crucially —
**we know nothing about any particular team**. No project names, no key IDs, no email
addresses, no bucket names.

For each argument, the question you are answering is:

- ✅ _"encryption key must not be blank/null"_ — structural, applies everywhere.
- ❌ _"encryption key must equal `projects/acme/keys/foo`"_ — assumes a specific key we
  cannot know. **Overreaching — invalid.**
- ✅ _"region must be in an approved set (whitelist)"_ — **region / data residency is a
  sanctioned exception**: enforcing it is explicitly wanted. Ideally the allowed set is
  parameterised, but a **hardcoded** example whitelist (e.g. `australia-southeast1/2`) is
  acceptable — the policy shape is fully repurposable by swapping the list.
- ❌ _"bucket name must be `prod-data`"_ — naming a specific resource. Invalid.

*Generic* means the policy could be written once and applied to every team without
knowing anything team-specific. If the only way to enforce something is to hardcode a
value that belongs to one team, that is not a platform policy — it's overreach.

We are ensuring **this resource is cleanly/securely configured** — we are **not** policing
the names of _other_ resources it references (other buckets, projects, datasets). Pointing
at another resource is the team's business; constraining that reference is not our job.

---

## 2. When is `security_impact = true`?

Mark `true` when a **generic** policy on the argument would improve security — i.e. it
matches one of the **policy archetypes** below. These archetypes are platform-agnostic;
they were distilled from real Azure platform policies and apply equally to GCP:

| Archetype                                                                | Pattern                                                                         | Example args                                                                 |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| **Disable public exposure**                                              | force private/no-public-access                                                  | `public_access_prevention`, "disable public network access"                  |
| **Require encryption / CMEK**                                            | key must be **set** (not blank); enable infra/double encryption                 | `kms_key_name`, `encryption.default_kms_key_name`                            |
| **Enforce secure protocol minimums**                                     | min TLS ≥ 1.2, etc.                                                             | TLS/version fields                                                           |
| **Whitelist secure tiers/SKUs**                                          | require tiers that _have_ the security features (evidence-based, not arbitrary) | `sku`/`tier` fields                                                          |
| **Disable weak/static auth**                                             | prefer managed identity / IAM over local/basic auth, SAS, shared keys           | local-auth toggles, SAS/HMAC keys                                            |
| **Require logging / audit**                                              | logging/diagnostics enabled and routed                                          | `logging.log_bucket`, diagnostic settings                                    |
| **Data residency**                                                       | region/location must be in an approved **whitelist**                            | `location`, `zone`, `region`                                                 |
| **Prevent destructive loss**                                             | block hard-destroy; require retention lock, soft-delete, purge protection       | `force_destroy` (→false), `retention_policy.is_locked`, `soft_delete_policy` |
| **Require managed identity**                                             | identity assigned to the resource                                               | identity blocks                                                              |
| **Credential hygiene**                                                   | enforce rotation / max age; disable static keys                                 | key rotation, SAS expiry                                                     |
| **Enable any security feature / disable anything that weakens security** | the catch-all                                                                   | various                                                                      |

Rule of thumb: **enable security features; disable or constrain things that weaken
security.** If an argument toggles or sizes one of those, it is almost always `true`.

The single biggest differentiator between strong and weak assessments is whether the
author actually found out what the argument does.

## 3. When is `security_impact = false`?

- **Identifiers & references** — names, IDs, and pointers to _other_ resources
  (`bucket`, `project`, `*_id`, "references existing X", policy `data` sources). We don't
  constrain what something is named or what it points at.
- **Cosmetic / descriptive** — `display_name`, `description`, `labels`, annotations.
- **Team data-management choices** that aren't security controls — e.g. `versioning`,
  cache `ttl`, autoclass. We don't dictate how teams manage their data _unless_ the field
  clearly prevents destructive loss or exposure.
- **Free-form policy documents** — e.g. IAM `policy_data` (a whole JSON policy). Writing a
  generic platform policy that meaningfully constrains an arbitrary embedded document is
  impractical → out of scope.
- **Anything that would require knowing a specific name/key/project/region/email** — if
  the only way to "enforce" it is to hardcode a specific value, it's overreaching → `false`.

---

## 3. Questions to ask of any argument

Work through these honestly for every argument — they are the analysis:

**Good IAM policy (`true`, worth enforcing):**

- Block **public** principals: `allUsers`, `allAuthenticatedUsers`.
- Block **wildcards** and obviously over-broad principal patterns.
- Block dangerous mixtures / overly-sensitive grants (e.g. public + privileged).
- → applies to `members` / `member`.

**Overreaching (don't enforce):**

- Dictating **which roles** a team may assign (teams need freedom to grant roles). → `role`
  is generally **not** a policy target.
- Controlling the embedded **`policy_data`** document. → out of scope.

_(Open for refinement: whether to block specific primitive roles like `roles/owner` on
public-facing resources. Default stance: leave role assignment to teams; police the
principals, not the role catalog.)_

---

## 5. Rationale standard

A rationale must **demonstrate understanding of what the argument controls** and give a
**reasonable justification** for why a policy is (or isn't) warranted.

- For a **`true`** arg: name the _risk if mis-set_ and the _secure direction/shape_ of the
  policy (without hardcoding specifics).
- For a **`false`** arg: briefly say what it controls and why constraining it doesn't
  improve security (or would be overreaching).
- Simple fields (`display_name`, `description`) → one short sentence is fine.
- Vague or complex fields → explain what they actually control before judging.
- Be specific and correct (no typos, no hand-wave like _"not security related"_ without
  saying what it is).

**Model rationales**

- `public_access_prevention` (true): _"Controls whether the bucket can be exposed
  publicly. Enforcing it 'enforced' prevents accidental public data exposure — a core
  platform guarantee."_
- `encryption.default_kms_key_name` (true): _"Sets the CMEK used to encrypt objects. A
  policy should require it to be non-empty so data is always customer-managed-key
  encrypted; it must **not** pin a specific key, since keys are team/project-specific."_
- `role` (false): _"Specifies the IAM role granted. Platform policy should not dictate
  which roles teams may assign; we constrain the principals (`members`) against public/
  wildcard grants instead."_
- `bucket` (false): _"Identifier referencing the target bucket. We don't constrain
  resource names or references to other resources."_

---

## 4. What a good rationale looks like

The rationale is where you prove the work happened. It must:

1. **Generic, not specific** — does the implied policy avoid hardcoding any specific name,
   key, project, region, or email? (whitelists/structural shapes are fine)
2. **Scoped to this resource** — it secureaustralia-southeast2s _this_ resource, not the names/config of
   resources it merely references.
3. **Real security gain** — enforcing it would genuinely make the resource more secure
   (maps to an archetype in §2). If not, it should be `false`.
4. **Not overreaching** — it doesn't dictate team choices that aren't security
   (role catalogs, data-management prefs, free-form policy docs).
5. **Rationale quality** — shows understanding of what the arg controls and gives a
   reasonable why/why-not; correct and specific (§5).

If you simply disagree that enforcing a policy here improves security, that's a valid
rejection — the bar is _"does a platform-level policy here make the resource more
secure?"_

---

## 7. Service notes

### Cloud Storage

Applying the principles to the real args:

- **Access / exposure (true):** `public_access_prevention`, `uniform_bucket_level_access`,
  IAM `members`/`member` (block public/wildcards), ACL `entity`/`role_entity`/
  `predefined_acl`/`default_acl`.
- **Encryption (true):** `encryption.default_kms_key_name` (bucket) and
  `storage_bucket_object.kms_key_name` — require **non-blank** CMEK; never pin a key.
  _(The bucket-level one is currently unassessed — a coverage gap to fill later.)_
- **Destructive loss (true):** `force_destroy` (disable), `retention_policy.is_locked` /
  `retention_period`, `soft_delete_policy` (enable).
- **Data residency (true):** `location` / `zone` — region **whitelist**.
- **Logging (true):** `logging.log_bucket` (enable). **Notifications** — team-dependent,
  generally not a policy target.
- **Not policy targets (false):** `bucket`/`project` and other identifiers/references;
  IAM `role` (team freedom); `policy_data` (free-form doc, overreaching);
  `versioning` and cache `ttl`/autoclass (team data-management, not security).

These match the existing `true`/`false` calls in the Cloud Storage files — the main
remaining work is **rationale quality** (several are vague or have typos) and **coverage**
(security-relevant args still on the `"true/false"` placeholder, e.g. bucket-level
encryption/logging/soft-delete).

## 8. Refinements from the service-wide review

Rulings established while reviewing every service — apply these consistently:

- **Run-as service accounts → `true`.** The account a _workload_ executes as (e.g.
  Dataflow/Workflows/Application Integration `service_account`) is a least-privilege
  control: require an explicit, **non-default** account (the default Compute Engine SA is
  over-privileged). Enforce "set and not the default" — never pin a specific account. (A
  service-account value used only as an inert reference, with no execution semantics,
  stays `false`.)
- **Delivery endpoint URLs → require `https://` (`true`).** Where a field is an endpoint
  that receives/sends data (e.g. Pub/Sub `push_endpoint`), requiring the TLS scheme is the
  secure-protocol archetype. Constrain the scheme only; never pin the host. (A URL that is
  purely a reference to a team-specific system — e.g. an SCM `host_uri` — stays `false`.)
- **Monitoring / observability → `true`.** Treat enable-monitoring like logging: require
  it on so activity is visible. For log-_level_ fields, require logging enabled (not OFF)
  for auditability — favour capturing security events over silencing logs.
- **Exposure allowlists → `true`.** A list that gates who can reach a private resource
  (e.g. `allowed_projects` on a private cluster) is a network-exposure control: constrain
  the allowlist _shape_ (non-empty, not overly broad); don't pin specific entries.

Confirmed **`false`** (not policy targets):

- Network **address ranges / CIDR blocks** — team addressing; segmentation is enforced by
  firewall/network-policy resources, not range sizing.
- **Functional / architectural enums** with no insecure value (serving scope, hosting
  type, HTTP method, store type, streaming-engine toggle, provisioning force-override).
- **References to other resources** (buckets/paths, networks, name servers, endpoints,
  driver names, store IDs) — we secure the referenced resource itself, not the pointer.
- **Backup retention length and deletion/cleanup policies** — data-management /
  operational hygiene, distinct from blocking destructive data loss.
- **Un-constrainable secret values and free-form documents** (auth tokens, OpenAPI/gRPC
  config blobs) — like IAM `policy_data`, a generic rule can't meaningfully constrain
  them. (Free-form **env-var maps** stay `true` on credential-hygiene grounds — a policy
  discourages plaintext secrets, pointing teams to Secret Manager.)

To be plain about it: the analysis is what is being assessed, not the final booleans.
Verdicts are checked, rationales are read, and reviewers are experienced at spotting
prose that describes an argument without understanding it — including the fluent,
confident, generically-worded kind. A rationale that doesn't demonstrate genuine
engagement with what the argument does *in this resource* will not pass, whatever the
verdict says.

_Add a new `### <Service>` subsection here as each service is reviewed._
