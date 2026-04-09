# Test Fixtures Guide

This document describes the test fixtures used for integration testing and how to maintain them.

## Overview

Integration tests use fixture files extracted from real Terraform provider documentation. These fixtures are committed to the repository for deterministic, network-independent testing.

## Fixture Structure

```
tests/docgen_v2/fixtures/
├── aws/
│   ├── dynamodb_table_v6.20.0.md
│   ├── dynamodb_table_v6.23.0.md
│   ├── eks_cluster_v6.20.0.md
│   ├── eks_cluster_v6.23.0.md
│   ├── s3_bucket_v6.20.0.md
│   └── s3_bucket_v6.23.0.md
├── azure/
│   ├── kubernetes_cluster_v4.51.0.md
│   ├── kubernetes_cluster_v4.54.0.md
│   └── ...
└── gcp/
    ├── container_cluster_v7.9.0.md
    ├── container_cluster_v7.12.0.md
    └── ...
```

**Note:** Fixture filenames do not include the CSP prefix (e.g., `s3_bucket` instead of `aws_s3_bucket`). This matches the output filename convention where generated JSON files also omit the CSP prefix.

## Fixture Selection Criteria

Each CSP has 3 resources with 2 versions each (6 files per CSP, 18 total):

- **Versions**: Latest stable release and a slightly older release (2-3 minor versions back)
- **Resources**: Selected based on:
  - Complexity (nested argument structures)
  - Confirmed changes between versions
  - Representative of common use cases

## Updating Fixtures

To refresh fixtures with newer provider versions:

### 1. Identify Available Versions

```bash
# For AWS
git -C scripts/docgen_v2/.cache/aws fetch --tags
git -C scripts/docgen_v2/.cache/aws tag -l 'v6.*' | sort -V | tail -10

# For Azure
git -C scripts/docgen_v2/.cache/azure fetch --tags
git -C scripts/docgen_v2/.cache/azure tag -l 'v4.*' | sort -V | tail -10

# For GCP
git -C scripts/docgen_v2/.cache/gcp fetch --tags
git -C scripts/docgen_v2/.cache/gcp tag -l 'v7.*' | sort -V | tail -10
```

### 2. Find Resources with Changes

```bash
# Example for AWS between v6.20.0 and v6.30.0
git -C scripts/docgen_v2/.cache/aws diff --stat v6.20.0..v6.30.0 -- website/docs/r/

# Look for complex resources with significant changes (high +/- line counts)
git -C scripts/docgen_v2/.cache/aws diff --stat v6.20.0..v6.30.0 -- website/docs/r/ | grep -E "(dynamodb|eks|s3_bucket)"
```

### 3. Extract Fixture Files

```bash
# Checkout newer version
git -C scripts/docgen_v2/.cache/aws checkout v6.30.0

# Copy resource file with version suffix (without CSP prefix in filename)
cp scripts/docgen_v2/.cache/aws/website/docs/r/s3_bucket.html.markdown \
   tests/docgen_v2/fixtures/aws/s3_bucket_v6.30.0.md

# Checkout older version
git -C scripts/docgen_v2/.cache/aws checkout v6.27.0

# Copy same resource from older version (without CSP prefix in filename)
cp scripts/docgen_v2/.cache/aws/website/docs/r/s3_bucket.html.markdown \
   tests/docgen_v2/fixtures/aws/s3_bucket_v6.27.0.md

# Restore cache to latest
git -C scripts/docgen_v2/.cache/aws checkout main
```

### 4. Update Tests

After updating fixtures, update the integration tests in `tests/docgen_v2/test_integration.py` to reference the new version numbers.

## Best Practices

- Always maintain version pairs (old + new) for change detection testing
- Choose resources with confirmed changes between versions
- Prefer complex resources with nested structures
- Keep fixtures up-to-date with recent provider versions (refresh every 6-12 months)
- Document any fixture changes in commit messages
