# Feature Handover: Version-Aware Policy Management

## 1. Feature Overview

**Feature:** Version-aware policy management
**Related task:** Add versioned policy packs scoped to Terraform Provider versions (HD)
**Branch:** Task/policy_versioning_by_provider
**Contributor:** Bao Minh Le (Noah)
**Current status:** Prototype implemented and tested; working end to end on real provider schemas

The Policy Deployment Engine (PDE) is currently designed to deploy policies for a single pinned
provider version. This feature enables PDE to work with multiple provider versions. It compares
two provider schemas, calculates the differences, and notes for each policy whether it remains
true on each version. This allows the team to support policies for customers that are using
older versions of the provider, and to immediately know which policies are still supported when
the provider version changes.

This handover guide describes the function, operation, and components of the feature, and what
future contributors should take into account when maintaining or extending it.

## 2. Original Problem

PDE's docs, inputs, and policies are based on one pinned provider version. Not all real
customers use the latest version and many stick to a previous version for a considerable amount of
time

This posed a number of difficulties:

- If a customer is on an older provider version and requests policies, PDE cannot serve them.
- If the provider publishes a new version, arguments are added, deleted, renamed, or change
  type, and no record is kept of which policies are still valid.
- Policies may cease to apply without any indication of the change in provider.
- No data could be used to answer the question "which of our policies are valid on version X?".

The feature had to do this without duplicating and maintaining the roughly one thousand
policies for each release.

## 3. Implemented Solution

The feature preserves the version tracking apart from the policies, as agreed with the project
lead. Policies are not duplicated per version; instead each policy is identified by a stable id,
and its validity is recorded per version.

The solution implemented offers:

- A read-only schema differ that compares two provider versions and returns the changes:
  arguments added, removed, renamed, or type-changed.
- Rename detection, so a renamed argument is not confused with a delete plus an add. Candidate
  pairs are evaluated by the similarity of the name, the type, and the description.
- A policy registry with a unique id (uid) for each policy, which is associated with a resource
  type and an argument but not a version, plus a per-version tested/valid map.
- A 3-step validity check which determines, for each policy and version, whether the version
  refers to the policy: the resource type exists, the argument exists, and the policy passes
  its test.
- A bridge to the project's own auto_test, so the "policy passes" step does not need to be
  reimplemented.

Everything is read-only: the feature only writes its own JSON map and reports, and never writes
anything to docs/, inputs/, policies/, or the plan cache.

## 4. How the Feature Works

### Step 1: Produce the version snapshots

Two provider schemas are created using `terraform providers schema -json`, one for each version
(for example 7.0.0 and 7.37.0). Each schema is the complete list of resource types and
arguments for that version

### Step 2: Compare the two versions (differ)

`schema_differ.py` flattens both schemas and compares them, reporting added, removed,
type-changed, and renamed arguments, and a migration summary 

### Step 3: Identify renames, not only deletes and adds

A rename is one removal and one addition. The differ scores each removed argument against each
added argument in the same parent block, on name, type, and description similarity. A high
score is treated as a confident rename, a middle score is marked for a human and a low score is
left as a real delete plus add

### Step 4: Build the policy registry and validity map

`policy_registry.py` assigns a uid (`resource_type::argument_path`) to each argument and
populates a map of uid to version to {tested, valid}

### Step 5: Perform the 3-step validity check

`validity_check.py` fills the map. For each policy and version it checks: does the resource type
exist in that version, does the argument exist, and does the policy pass its test. Steps one and
two are calculated from the schema then step three reuses the project's auto_test via
`build_results.py`

### Result

The map indicates, per policy and per version, whether the policy applies and is valid. On real
data (7.0.0 to 7.37.0), all 101 existing policies on the three assigned Compute Engine resources
migrate automatically, 11 new arguments are exposed as new work, and across the whole GCP
provider the 7.x line is almost purely additive (0 renamed)

## 5. Files Involved

| File : Role in the feature |
`scripts/versioning/schema_differ.py`: Compares two provider versions and detects renames 
`scripts/versioning/policy_registry.py`: Gives each policy a uid and a per-version tested/valid map 
`scripts/versioning/validity_check.py` : The 3-step check (resource exists, argument exists, policy passes) 
`scripts/versioning/build_results.py`:  Bridges the project's auto_test into the validity map |
`scripts/versioning/test_differ.py`: Tests for the differ and rename detection (7 tests) 
`scripts/versioning/test_policy_registry.py`: Tests for the registry and validity map (10 tests) 
`scripts/versioning/test_validity_check.py` : Tests for the 3-step check (11 tests) 
`scripts/versioning/fixtures/`:  Small synthetic schemas used for tests and demos 

