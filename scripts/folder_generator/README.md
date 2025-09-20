# Cloud Policy Generator
## What is this?

This is a Python-based desktop application that helps users generate cloud policy files based on Terraform provider service and resource definitions stored locally.
It loads these definitions from JSON files in a structured directory, allowing users to pick a cloud, service, and resource, then generate policy templates with ease.

## What it does?

- Scans local JSON files from the `docs` directory to find cloud services and their resources.
- Caches this data in memory during runtime (no cache files saved on disk).
- Provides a GUI for selecting cloud, service, resource, and entering a policy name.
- Generates Terraform and Rego policy files in corresponding folders based on templates.
- Allows refreshing the service/resource list by rescanning the JSON docs.

## How to use?

### Prerequisites

Before running the app, install dependencies with:`

```bash
pip install -r requirements.txt
```


### Running the Application

Navigate to the `/scripts/folder-generator/` directory and run:`

python main.py


### Using the GUI

1. Select a cloud provider (e.g., GCP).
2. Select a service from the list (populated from local JSON files).
3. Select a resource under the chosen service.
4. Enter a policy name (alphabetical characters with optional underscores).
5. Click **Create Policy** to generate the policy files and folder structure.
6. Use **Refresh Services** to rescan the docs folder if JSON files change.

### Generated Output Structure

Policy files and inputs are created under:`

inputs/{cloud}/{service}/{resource}/{policy_name}/\
policies/{cloud}/{service}/{resource}/{policy_name}/


## Notes

- Service/resource data lives only in runtime memory; no JSON cache files are saved.
- Policy names must conform to the pattern: alphabets and underscores only (e.g `my_policy`).
- The templates folder must contain the required Terraform and Rego template files mentioned in the config.
- The app requires Python 3 with dependencies installed via `pip install -r requirements.txt`.

---

