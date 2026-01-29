# Terraform JSON Spec Generator

A command-line tool that extracts Terraform resource schemas from provider documentation and generates standardized JSON specification files. The generator creates a hierarchical folder structure organized by cloud service provider (CSP) and service, with each resource represented as a separate JSON file containing its complete argument schema.

## Features

- **Multi-Provider Support**: Works with AWS, Azure, and GCP Terraform providers
- **Automated Extraction**: Parses provider documentation to extract resource schemas, arguments, and metadata
- **Version Tracking**: Supports specific provider versions with automatic version detection
- **Change Detection**: Compares schemas across versions and generates detailed change reports
- **Batch Processing**: Process entire providers, specific services, or individual resources
- **Dry-Run Mode**: Validate operations without making filesystem changes (enabled by default)
- **Smart Caching**: Clones provider repositories once and reuses them across runs
- **Deprecation Tracking**: Identifies and marks deprecated resources and arguments

## Installation

### Prerequisites

- **Python 3.8+**
- **uv** package manager ([installation guide](https://docs.astral.sh/uv/getting-started/installation/))
- **git** (for cloning provider repositories)

### Install uv

Choose one of the following methods:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

```bash
pip install uv
```

```bash
brew install uv
```

### Setup

The generator is part of the Policy Deployment Engine project. No additional installation is required beyond having `uv` installed.

Navigate to the project root:

```bash
cd /path/to/Policy-Deployment-Engine
```

Verify the generator is accessible:

```bash
uv run python scripts/docgen_v2/generator.py --help
```

## Quick Start

Preview what would be generated for AWS without writing any files (dry-run mode is default):

```bash
uv run python scripts/docgen_v2/generator.py --csp aws
```

Generate JSON specs for all AWS services:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

Process specific services only:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --service s3 ec2 --no-dry-run
```

Use a specific provider version:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --provider-version 5.70.0 --no-dry-run
```

## CLI Usage

### Required Arguments

#### `--csp`

Specify the cloud service provider to process.

**Choices**: `aws`, `azure`, `gcp`

```bash
uv run python scripts/docgen_v2/generator.py --csp aws
```

### Optional Arguments

#### `--service`

Process specific service(s) instead of all services. Accepts multiple space-separated service names.

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --service s3 ec2 lambda
```

If not provided, all services for the CSP will be processed.

#### `--provider-version`

Specify the Terraform provider version to use. Format: `X.Y.Z` (e.g., `5.70.0`).

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --provider-version 5.70.0 --no-dry-run
```

If not provided, the generator will auto-detect the version from the cached repository and check for updates.

#### `--output-dir`

Specify the base output directory for generated files.

**Default**: `docs/`

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --output-dir /custom/path --no-dry-run
```

#### `--cache-dir`

Specify a custom cache directory for provider repositories.

**Default**: `scripts/docgen_v2/.cache/`

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --cache-dir /tmp/terraform-cache --no-dry-run
```

#### `--dry-run` / `--no-dry-run`

Control execution mode. Dry-run mode is enabled by default for safety.

**Dry-run mode** (default): Simulates all operations without creating directories or writing files. Useful for validation and preview.

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --dry-run
```

**Execution mode**: Actually creates directories and writes files.

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

#### `--update-cache`

Update cached provider repositories from remote before processing. Forces a git pull to get the latest documentation.

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --update-cache --no-dry-run
```

Use this when:
- You see a warning about a newer version being available
- You want to ensure you have the latest provider documentation
- The cache might be stale

#### `--silent`

Suppress console output (INFO and DEBUG messages). Errors and warnings are still shown to stderr.

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --silent --no-dry-run
```

Useful for:
- CI/CD pipelines
- Automated scripts
- When you only care about errors

## Cache Management

### How Caching Works

The generator clones Terraform provider repositories to avoid repeated network requests. Repositories are cloned using **sparse checkout** to only download the documentation directory (`website/docs/r/`), significantly reducing disk space and clone time.

### Cache Location

**Default**: `scripts/docgen_v2/.cache/{csp}/`

Example structure:

```
scripts/docgen_v2/.cache/
├── aws/
│   └── terraform-provider-aws/
├── azure/
│   └── terraform-provider-azurerm/
└── gcp/
    └── terraform-provider-google/
```

### Version Detection

When `--provider-version` is not specified, the generator automatically detects the version from the cached repository:

1. Checks if the current HEAD is on a specific tag (e.g., `v5.70.0`)
2. If not, uses the latest tag in the repository
3. Falls back to "unknown" if no tags exist

After detection, the generator checks for newer versions remotely and displays a warning if an update is available.

### Updating the Cache

When you see a warning about a newer version:

```
WARNING - Newer version available: v5.71.0 (using v5.70.0). Run with --update-cache to update.
```

Update the cache:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --update-cache --no-dry-run
```

This performs a `git pull` to fetch the latest documentation.

### Manual Cache Refresh

To completely refresh the cache (remove and re-clone):

```bash
rm -rf scripts/docgen_v2/.cache/aws
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

The generator will automatically clone the repository on the next run.

### Cache Size

- **Sparse checkout**: ~10-50MB per provider
- **Full clone**: ~100-500MB per provider (not used)
- **Total for all 3 providers**: ~30-150MB

## Output Structure

### Directory Hierarchy

Generated files are organized by CSP and service:

```
docs/
└── {csp}/
    ├── {service_1}/
    │   └── resource_json/
    │       ├── {resource_1}.template.json
    │       ├── {resource_2}.template.json
    │       └── ...
    ├── {service_2}/
    │   └── resource_json/
    │       └── ...
    ├── changes/
    │   └── {old_version}-to-{new_version}/
    │       ├── {resource_1}.md
    │       ├── {resource_2}.md
    │       └── summary.md
    └── metadata.{timestamp}.json
```

### Resource JSON Files

Each resource is saved as `{resource_name_without_csp_prefix}.template.json`.

Example: `aws_s3_bucket` → `s3_bucket.template.json`

**Location**: `docs/{csp}/{service}/resource_json/`

**Format**:

```json
{
  "_metadata": {
    "provider": "aws",
    "version": "5.70.0",
    "generated_at": "2024-11-30T10:30:00Z"
  },
  "resource_name": "aws_s3_bucket",
  "subcategory": "S3 (Simple Storage)",
  "arguments": {
    "bucket": {
      "description": "Name of the bucket",
      "required": false,
      "deprecated": false,
      "security_impact": null,
      "rationale": null,
      "compliant": null,
      "non_compliant": null,
      "parent": null
    },
    "tags": {
      "description": "Map of tags to assign to the bucket",
      "required": false,
      "deprecated": false,
      "security_impact": null,
      "rationale": null,
      "compliant": null,
      "non_compliant": null,
      "parent": null
    }
  }
}
```

### Metadata Files

Timestamped metadata files track each generation run.

**Location**: `docs/{csp}/metadata.{timestamp}.json`

**Format**:

```json
{
  "provider": "aws",
  "version": "5.70.0",
  "generated_at": "2024-11-30T10:30:00Z",
  "resources": {
    "S3 (Simple Storage)": [
      "aws_s3_bucket",
      "aws_s3_bucket_acl",
      "aws_s3_object"
    ],
    "EC2 (Elastic Compute Cloud)": [
      "aws_instance",
      "aws_ami"
    ]
  },
  "statistics": {
    "total_services": 2,
    "total_resources": 5
  }
}
```

### Change Reports

When updating to a new provider version, change reports document the differences.

**Location**: `docs/{csp}/changes/{old_version}-to-{new_version}/`

**Files**:
- `{resource_name}.md` - Individual resource change report
- `summary.md` - Summary of all changes in this version upgrade

**Example**: `docs/aws/changes/5.70.0-to-5.71.0/s3_bucket.md`

## Common Workflows

### Process All Services for a CSP

Generate JSON specs for all services in AWS:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

This will:
1. Clone/reuse the AWS provider repository
2. Auto-detect the provider version
3. Process all services
4. Generate JSON files for all resources
5. Create a timestamped metadata file

### Process Specific Services

Generate specs for S3 and EC2 only:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --service s3 ec2 --no-dry-run
```

### Update to New Provider Version

When a new provider version is released:

1. Update the cache:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --update-cache --no-dry-run
```

2. The generator will:
   - Pull the latest documentation
   - Detect the new version
   - Compare with existing JSON files
   - Generate change reports for modified resources
   - Update all JSON files

3. Review the change reports:

```bash
ls docs/aws/changes/5.70.0-to-5.71.0/
```

### Compare Versions

Generate specs for two different versions to compare:

First version:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --provider-version 5.70.0 --no-dry-run
```

Second version:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --provider-version 5.71.0 --no-dry-run
```

Change reports will be automatically generated in `docs/aws/changes/5.70.0-to-5.71.0/`.

### Dry-Run Before Execution

Always preview changes before writing files:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --service s3
```

Review the output, then execute:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --service s3 --no-dry-run
```

### Silent Mode for CI/CD

Run in silent mode to suppress progress messages:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --silent --no-dry-run
```

Only errors and warnings will be displayed.

## Error Codes and Troubleshooting

### Exit Codes

The generator uses specific exit codes to indicate error categories:

| Exit Code | Category | Description |
|-----------|----------|-------------|
| 0 | Success | Operation completed successfully |
| 1 | Configuration Error | Invalid arguments or configuration |
| 2 | Connection Error | Unable to access provider documentation |
| 3 | Parsing Error | Malformed documentation or schema |
| 4 | Filesystem Error | Unable to create directories or write files |
| 5 | Validation Error | Generated JSON fails validation |

### Common Errors and Solutions

#### Configuration Error (Exit Code 1)

**Error**: `Output path exists but is not a directory`

**Solution**: The specified output path is a file, not a directory. Remove the file or choose a different path.

```bash
rm docs
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

**Error**: `Invalid CSP identifier`

**Solution**: Use one of the supported CSPs: `aws`, `azure`, or `gcp`.

```bash
uv run python scripts/docgen_v2/generator.py --csp aws
```

#### Connection Error (Exit Code 2)

**Error**: `Failed to clone provider repository`

**Possible Causes**:
- No internet connection
- Git not installed
- Repository URL changed
- Network firewall blocking git

**Solution**: Check your internet connection and ensure git is installed:

```bash
git --version
```

Try cloning manually to diagnose:

```bash
git clone --depth 1 --filter=blob:none --sparse https://github.com/hashicorp/terraform-provider-aws
```

#### Parsing Error (Exit Code 3)

**Error**: `Missing argument reference section`

**Cause**: The provider documentation format has changed or is malformed.

**Solution**: This usually indicates a bug in the parser or a significant change in provider documentation format. Check the specific resource file mentioned in the error and report the issue.

#### Filesystem Error (Exit Code 4)

**Error**: `Permission denied`

**Solution**: Ensure you have write permissions to the output directory:

```bash
chmod u+w docs/
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

**Error**: `Disk full`

**Solution**: Free up disk space or use a different output directory:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --output-dir /path/with/space --no-dry-run
```

#### Validation Error (Exit Code 5)

**Error**: `Missing required field 'description'`

**Cause**: The extracted schema is incomplete or malformed.

**Solution**: This indicates a parsing issue. The resource name will be included in the error message. Report this as a bug with the specific resource name.

### Debug Tips

#### Enable Verbose Logging

Check the log files for detailed information:

```bash
cat scripts/docgen_v2/logs/generator.log
```

Logs include DEBUG-level information not shown in console output.

#### Test with a Single Service

Narrow down issues by testing with a single service:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --service s3 --no-dry-run
```

#### Use Dry-Run Mode

Always test with dry-run first to catch configuration issues:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws
```

#### Check Cache State

Verify the cache directory exists and contains the provider repository:

```bash
ls -la scripts/docgen_v2/.cache/aws/
```

#### Clear Cache and Retry

If you suspect cache corruption:

```bash
rm -rf scripts/docgen_v2/.cache/aws
uv run python scripts/docgen_v2/generator.py --csp aws --no-dry-run
```

## Advanced Usage

### Custom Cache Directory

Use a custom cache location (useful for shared caches or specific disk partitions):

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --cache-dir /mnt/cache/terraform --no-dry-run
```

### Custom Output Directory

Generate files to a custom location:

```bash
uv run python scripts/docgen_v2/generator.py --csp aws --output-dir /custom/output --no-dry-run
```

### Process Multiple CSPs

Process all three CSPs sequentially:

```bash
for csp in aws azure gcp; do
  uv run python scripts/docgen_v2/generator.py --csp $csp --no-dry-run
done
```

### Automated Version Updates

Create a script to check for updates and regenerate specs:

```bash
#!/bin/bash
for csp in aws azure gcp; do
  echo "Processing $csp..."
  uv run python scripts/docgen_v2/generator.py \
    --csp $csp \
    --update-cache \
    --silent \
    --no-dry-run
done
```

### CI/CD Integration

Example GitHub Actions workflow:

```yaml
name: Update Terraform Specs

on:
  schedule:
    - cron: '0 0 * * 0'
  workflow_dispatch:

jobs:
  update-specs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install uv
        run: curl -LsSf https://astral.sh/uv/install.sh | sh
      
      - name: Generate AWS specs
        run: |
          uv run python scripts/docgen_v2/generator.py \
            --csp aws \
            --update-cache \
            --silent \
            --no-dry-run
      
      - name: Commit changes
        run: |
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git add docs/
          git commit -m "Update Terraform specs" || exit 0
          git push
```

## Project Structure

```
scripts/docgen_v2/
├── .cache/                    # Cached provider repositories
│   ├── aws/
│   ├── azure/
│   └── gcp/
├── lib/                       # Core implementation modules
│   ├── cli.py                # Command-line argument parsing
│   ├── errors.py             # Error handling and exit codes
│   ├── logging_config.py     # Logging configuration
│   ├── metadata_manager.py   # Metadata file management
│   ├── models.py             # Data models (Resource, Argument)
│   ├── orchestrator.py       # Main processing orchestrator
│   ├── parser.py             # Markdown parsing functions
│   ├── report_generator.py   # Change report generation
│   ├── repository_manager.py # Git repository management
│   ├── resource_change_detector.py  # Version comparison
│   ├── resource_file_manager.py     # JSON file operations
│   ├── resource_processor.py        # Schema validation
│   └── schema_extractor.py          # Schema extraction coordinator
├── logs/                      # Log files
│   └── generator.log
├── generator.py              # Main entry point
└── README.md                 # This file
```

## License

Part of the Policy Deployment Engine project.
