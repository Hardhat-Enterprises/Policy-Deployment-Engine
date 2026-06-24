"""
Repository Manager for Terraform Provider Documentation

Manages cloning, caching, and accessing Terraform provider repositories
to extract resource documentation. Uses sparse checkout to minimize disk
space and clone time by only fetching the documentation directory.

Features:
    - Sparse checkout of website/docs/r/ directory only
    - Local caching to scripts/docgen_v2/.cache/{csp}/
    - Version-specific checkout via git tags
    - Cache hit/miss logging for transparency
    - Support for AWS, Azure, and GCP providers

Cache Strategy:
    - Repos cached to scripts/docgen_v2/.cache/{csp}/
    - Sparse checkout reduces size from 100-500MB to 10-50MB per provider
    - Cache persists across runs (no automatic cleanup)
    - To refresh: delete cache directory and re-run

Example:
    >>> from scripts.docgen_v2.repository_manager import RepositoryManager
    >>> repo_mgr = RepositoryManager()
    >>> repo_path = repo_mgr.clone_provider_repo('aws', version='5.70.0')
    >>> resources = repo_mgr.list_all_resources(repo_path)
    >>> print(f"Found {len(resources)} resources")

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import re
import subprocess
from pathlib import Path
from typing import List, Optional
from scripts.docgen_v2.lib.logging_config import get_logger
from scripts.docgen_v2.lib.parser import parse_resource_markdown
from scripts.docgen_v2.lib.errors import ConnectionError, ParsingError, ConfigurationError

logger = get_logger(__name__)


# Provider repository URLs
PROVIDER_REPOS = {
    'aws': 'https://github.com/hashicorp/terraform-provider-aws.git',
    'azure': 'https://github.com/hashicorp/terraform-provider-azurerm.git',
    'gcp': 'https://github.com/hashicorp/terraform-provider-google.git'
}


class RepositoryManager:
    """
    Manages Terraform provider repository cloning and access.
    
    Handles cloning provider repositories with sparse checkout to minimize
    disk usage, caching for performance, and version-specific checkouts.
    
    Attributes:
        cache_dir (Path): Base directory for cached repositories
    
    Example:
        >>> repo_mgr = RepositoryManager()
        >>> repo_path = repo_mgr.clone_provider_repo('aws')
        >>> markdown_path = repo_mgr.get_resource_markdown_path(repo_path, 'aws_s3_bucket')
    """
    
    def __init__(self, cache_dir: Optional[Path] = None):
        """
        Initialize the repository manager.
        
        Args:
            cache_dir: Custom cache directory. If None, uses default
                      scripts/docgen_v2/.cache/
        """
        if cache_dir is None:
            # Default to scripts/docgen_v2/.cache/ relative to this file
            current_file = Path(__file__)  # scripts/docgen_v2/lib/repository_manager.py
            docgen_v2_dir = current_file.parent.parent  # Go up 2 levels to scripts/docgen_v2/
            cache_dir = docgen_v2_dir / '.cache'
        
        self.cache_dir = cache_dir
        logger.debug(f"Repository manager initialized with cache dir: {self.cache_dir}")
    
    def clone_provider_repo(self, csp: str, version: Optional[str] = None) -> Path:
        """
        Clone or access cached provider repository with sparse checkout.
        
        Clones the provider repository if not already cached, using sparse
        checkout to only fetch the documentation directory. If already cached,
        reuses the existing clone.
        
        Args:
            csp: Cloud service provider ('aws', 'azure', or 'gcp')
            version: Optional provider version tag (e.g., 'v5.70.0', '5.70.0')
                    If None, uses the default branch
        
        Returns:
            Path: Path to the cloned repository
        
        Raises:
            ValueError: If CSP is not supported
            subprocess.CalledProcessError: If git operations fail
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> # First call clones the repo
            >>> repo_path = repo_mgr.clone_provider_repo('aws', version='5.70.0')
            >>> # Second call reuses cached repo
            >>> repo_path = repo_mgr.clone_provider_repo('aws', version='5.70.0')
        
        Note:
            - Sparse checkout only fetches website/docs/r/ directory
            - Cache is persistent across runs
            - Version checkout happens after clone if specified
        """
        if csp not in PROVIDER_REPOS:
            raise ConfigurationError(
                f"Unsupported CSP: {csp}. "
                f"Supported providers: {', '.join(PROVIDER_REPOS.keys())}",
                operation="provider repository lookup"
            )
        
        repo_url = PROVIDER_REPOS[csp]
        repo_path = self.cache_dir / csp
        
        # Check if repo already exists
        if repo_path.exists() and (repo_path / '.git').exists():
            logger.info(f"Cache hit: Using existing repository at {repo_path}")
            
            # Checkout specific version if requested
            if version:
                self._checkout_version(repo_path, version)
            
            return repo_path
        
        # Cache miss - need to clone
        logger.info(f"Cache miss: Cloning {csp} provider repository from {repo_url}")
        logger.info(f"This may take 1-2 minutes on first run...")
        
        # Create cache directory
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        
        # Clone with sparse checkout
        self._clone_with_sparse_checkout(repo_url, repo_path)
        
        # Checkout specific version if requested
        if version:
            self._checkout_version(repo_path, version)
        
        logger.info(f"Repository cloned successfully to {repo_path}")
        return repo_path
    
    def _clone_with_sparse_checkout(self, repo_url: str, repo_path: Path) -> None:
        """
        Clone repository with sparse checkout for documentation only.
        
        Uses git sparse-checkout to only fetch the website/docs/r/ directory,
        significantly reducing clone size and time.
        
        Args:
            repo_url: Git repository URL
            repo_path: Local path to clone to
        
        Raises:
            subprocess.CalledProcessError: If git commands fail
        """
        try:
            # Initialize empty repo
            subprocess.run(
                ['git', 'init', str(repo_path)],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Add remote
            subprocess.run(
                ['git', '-C', str(repo_path), 'remote', 'add', 'origin', repo_url],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Enable sparse checkout
            subprocess.run(
                ['git', '-C', str(repo_path), 'config', 'core.sparseCheckout', 'true'],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Specify sparse checkout path
            sparse_checkout_file = repo_path / '.git' / 'info' / 'sparse-checkout'
            sparse_checkout_file.parent.mkdir(parents=True, exist_ok=True)
            sparse_checkout_file.write_text('website/docs/r/\n')
            
            # Pull only the specified directory
            logger.debug("Fetching documentation directory (sparse checkout)...")
            subprocess.run(
                ['git', '-C', str(repo_path), 'pull', 'origin', 'main'],
                check=True,
                capture_output=True,
                text=True
            )
            
        except subprocess.CalledProcessError as e:
            logger.error(f"Git operation failed: {e.stderr}")
            # Clean up partial clone
            if repo_path.exists():
                import shutil
                shutil.rmtree(repo_path)
            raise ConnectionError(
                f"Failed to clone provider repository: {e.stderr}",
                file_path=repo_url,
                operation="git clone"
            ) from e
    
    def _checkout_version(self, repo_path: Path, version: str) -> None:
        """
        Checkout a specific version tag in the repository.
        
        Args:
            repo_path: Path to the git repository
            version: Version tag (e.g., 'v5.70.0' or '5.70.0')
        
        Raises:
            subprocess.CalledProcessError: If checkout fails
        
        Note:
            Automatically adds 'v' prefix if not present in version string
        """
        # Normalize version tag (add 'v' prefix if not present)
        if not version.startswith('v'):
            version = f'v{version}'
        
        logger.info(f"Checking out version {version}")
        
        try:
            # Fetch tags if not already fetched
            subprocess.run(
                ['git', '-C', str(repo_path), 'fetch', '--tags'],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Checkout the specific tag
            subprocess.run(
                ['git', '-C', str(repo_path), 'checkout', version],
                check=True,
                capture_output=True,
                text=True
            )
            
            logger.debug(f"Successfully checked out version {version}")
            
        except subprocess.CalledProcessError as e:
            logger.error(f"Failed to checkout version {version}: {e.stderr}")
            raise ConnectionError(
                f"Failed to checkout version {version}: {e.stderr}",
                file_path=str(repo_path),
                operation="git checkout"
            ) from e
    
    def get_current_version(self, repo_path: Path) -> str:
        """
        Auto-detect the current version from the git repository.
        
        Attempts to determine the version using multiple strategies:
        1. If on a specific tag: returns that tag (e.g., "v6.14.0")
        2. If on main/master branch: returns the latest tag (e.g., "v6.14.0")
        3. If no tags exist: returns "unknown"
        
        Args:
            repo_path: Path to the git repository
        
        Returns:
            str: Detected version string (e.g., "v6.14.0")
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> repo_path = repo_mgr.clone_provider_repo('aws')
            >>> version = repo_mgr.get_current_version(repo_path)
            >>> print(version)  # "v6.14.0"
        
        Note:
            - Fetches tags from remote if not already fetched
            - Returns version with 'v' prefix for consistency
            - Falls back to "unknown" if version cannot be determined
        """
        try:
            # Fetch tags to ensure we have the latest
            subprocess.run(
                ['git', '-C', str(repo_path), 'fetch', '--tags'],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Try to get the exact tag at current HEAD
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'describe', '--exact-match', '--tags', 'HEAD'],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0:
                version = result.stdout.strip()
                logger.info(f"Detected version from current tag: {version}")
                return version

            # Not on a specific tag — find the globally latest tag across all branches.
            # We intentionally skip `git describe --tags --abbrev=0` here because it
            # only walks the current branch's ancestors, which misses release tags that
            # live on release branches (e.g. Terraform provider tagging strategy).
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'tag', '--sort=-version:refname'],
                capture_output=True,
                text=True
            )

            if result.returncode == 0 and result.stdout.strip():
                tags = result.stdout.strip().split('\n')
                if tags and tags[0]:
                    version = tags[0]
                    logger.info(f"Detected version from most recent tag: {version}")
                    return version
            
            # No tags found
            logger.warning("No git tags found in repository, using 'unknown' as version")
            return "unknown"
            
        except subprocess.CalledProcessError as e:
            logger.warning(f"Failed to detect version from git: {e.stderr}")
            return "unknown"
        except Exception as e:
            logger.warning(f"Unexpected error detecting version: {e}")
            return "unknown"
    
    def check_for_updates(self, repo_path: Path, current_version: str) -> Optional[str]:
        """
        Check if a newer version is available remotely.
        
        Fetches the latest tags from the remote repository and compares
        with the current version to determine if an update is available.
        
        Args:
            repo_path: Path to the git repository
            current_version: Current version being used (e.g., "v6.14.0")
        
        Returns:
            Optional[str]: Latest remote version if newer than current, None otherwise
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> repo_path = repo_mgr.clone_provider_repo('aws')
            >>> latest = repo_mgr.check_for_updates(repo_path, "v6.14.0")
            >>> if latest:
            ...     print(f"Update available: {latest}")
        
        Note:
            - Fetches tags from remote (network call)
            - Returns None if no newer version or if check fails
            - Compares version strings lexicographically
        """
        try:
            # Fetch latest tags from remote
            logger.debug("Checking for updates from remote...")
            subprocess.run(
                ['git', '-C', str(repo_path), 'fetch', '--tags'],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Get latest remote tag
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'tag', '--sort=-version:refname'],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0 and result.stdout.strip():
                latest_remote = result.stdout.strip().split('\n')[0]
                
                # Compare versions (simple string comparison works for semantic versioning)
                if latest_remote != current_version:
                    logger.debug(f"Newer version available: {latest_remote} (current: {current_version})")
                    return latest_remote
                else:
                    logger.debug(f"Cache is up-to-date: {current_version}")
                    return None
            
            return None
            
        except subprocess.CalledProcessError as e:
            logger.debug(f"Could not check for updates: {e.stderr}")
            return None
        except Exception as e:
            logger.debug(f"Unexpected error checking for updates: {e}")
            return None
    
    def update_cache(self, repo_path: Path) -> Optional[str]:
        """
        Update cached repository from remote and checkout the latest released tag.

        Pulls the latest changes from main (which carries new tags), then checks out
        the most recent version tag so that subsequent reads reflect the latest provider
        documentation.

        Args:
            repo_path: Path to the git repository

        Returns:
            Optional[str]: The latest version tag checked out (e.g. "v7.35.0"), or None on failure

        Raises:
            ConnectionError: If git pull fails

        Note:
            - Pulls main branch then checks out the latest semver tag
            - Only updates files in sparse checkout (website/docs/r/)
        """
        try:
            logger.info("Updating cache from remote...")

            # Switch to main branch so we can pull (may be in detached HEAD from previous run)
            subprocess.run(
                ['git', '-C', str(repo_path), 'checkout', 'main'],
                check=True,
                capture_output=True,
                text=True
            )

            # Pull latest changes and tags
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'pull', 'origin', 'main'],
                check=True,
                capture_output=True,
                text=True
            )
            logger.debug(f"Git pull output: {result.stdout}")

            # Fetch all tags (pull may not bring all release-branch tags)
            subprocess.run(
                ['git', '-C', str(repo_path), 'fetch', '--tags'],
                check=True,
                capture_output=True,
                text=True
            )

            # Find the latest semver tag
            tag_result = subprocess.run(
                ['git', '-C', str(repo_path), 'tag', '--sort=-version:refname'],
                capture_output=True,
                text=True
            )

            latest_tag = None
            if tag_result.returncode == 0 and tag_result.stdout.strip():
                tags = tag_result.stdout.strip().split('\n')
                if tags and tags[0]:
                    latest_tag = tags[0]

            if latest_tag:
                subprocess.run(
                    ['git', '-C', str(repo_path), 'checkout', latest_tag],
                    check=True,
                    capture_output=True,
                    text=True
                )
                logger.info(f"Cache updated — checked out latest version: {latest_tag}")
            else:
                logger.warning("No tags found after update; staying on main branch")

            return latest_tag

        except subprocess.CalledProcessError as e:
            logger.error(f"Failed to update cache: {e.stderr}")
            raise ConnectionError(
                f"Failed to update cache from remote: {e.stderr}",
                file_path=str(repo_path),
                operation="git pull"
            ) from e
    
    def get_resource_markdown_path(self, repo_path: Path, resource_name: str) -> Path:
        """
        Get the path to a resource's markdown documentation file.
        
        Args:
            repo_path: Path to the provider repository
            resource_name: Name of the resource (e.g., 'aws_s3_bucket')
        
        Returns:
            Path: Path to the markdown file
        
        Raises:
            FileNotFoundError: If the markdown file doesn't exist
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> repo_path = repo_mgr.clone_provider_repo('aws')
            >>> md_path = repo_mgr.get_resource_markdown_path(repo_path, 'aws_s3_bucket')
            >>> print(md_path)  # .../repos/aws/website/docs/r/s3_bucket.html.markdown
        
        Note:
            The resource name prefix (aws_, azurerm_, google_) is stripped
            from the filename in the repository structure.
        """
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        
        # Strip provider prefix from resource name for filename
        # aws_s3_bucket -> s3_bucket.html.markdown
        if resource_name.startswith('aws_'):
            filename = resource_name[4:] + '.html.markdown'
        elif resource_name.startswith('azurerm_'):
            filename = resource_name[8:] + '.html.markdown'
        elif resource_name.startswith('google_'):
            filename = resource_name[7:] + '.html.markdown'
        else:
            filename = resource_name + '.html.markdown'
        
        markdown_path = docs_dir / filename

        if not markdown_path.exists():
            # The GCP provider is inconsistent about doc filenames: most drop the
            # provider prefix (kms_crypto_key.html.markdown), but a cluster of core
            # resources keep it (google_project.html.markdown, google_folder.html.markdown).
            # Try the prefix-retained filename before falling back to IAM handling.
            prefixed_path = docs_dir / f"{resource_name}.html.markdown"
            if prefixed_path.exists():
                return prefixed_path

            # For IAM resource variants (e.g. google_foo_iam_policy → foo_iam.html.markdown)
            for iam_suffix in ('_iam_policy', '_iam_binding', '_iam_member', '_iam_audit_config'):
                if resource_name.endswith(iam_suffix):
                    base = resource_name[:-len(iam_suffix)]  # strip _policy/_binding/_member
                    iam_stem = base  # already has provider prefix stripped above
                    # Re-derive iam_stem without provider prefix
                    for pfx in ('aws_', 'azurerm_', 'google_'):
                        if base.startswith(pfx):
                            iam_stem = base[len(pfx):]
                            break
                    iam_path = docs_dir / f"{iam_stem}_iam.html.markdown"
                    if iam_path.exists():
                        return iam_path
                    # Some GCP IAM files include the provider prefix in the filename
                    # (e.g., google_folder_iam.html.markdown instead of folder_iam.html.markdown)
                    for pfx in ('aws_', 'azurerm_', 'google_'):
                        if resource_name.startswith(pfx):
                            iam_path_prefixed = docs_dir / f"{pfx}{iam_stem}_iam.html.markdown"
                            if iam_path_prefixed.exists():
                                return iam_path_prefixed
                            break
                    break

            raise ParsingError(
                "Markdown file not found",
                resource_name=resource_name,
                file_path=str(markdown_path),
                operation="locate resource documentation"
            )

        return markdown_path
    
    def list_all_resources(self, repo_path: Path) -> List[str]:
        """
        List all resource markdown files in the repository.
        
        Args:
            repo_path: Path to the provider repository
        
        Returns:
            List[str]: List of resource names (with provider prefix)
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> repo_path = repo_mgr.clone_provider_repo('aws')
            >>> resources = repo_mgr.list_all_resources(repo_path)
            >>> print(resources[:3])  # ['aws_s3_bucket', 'aws_s3_bucket_acl', ...]
        
        Note:
            - Only includes .html.markdown files
            - Adds appropriate provider prefix to resource names
            - Filters out data source files (those in website/docs/d/)
        """
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        
        if not docs_dir.exists():
            logger.warning(f"Documentation directory not found: {docs_dir}")
            return []
        
        # Determine provider prefix from repo path
        csp = repo_path.name
        if csp == 'aws':
            prefix = 'aws_'
        elif csp == 'azure':
            prefix = 'azurerm_'
        elif csp == 'gcp':
            prefix = 'google_'
        else:
            prefix = ''
        
        # Some GCP doc filenames already carry the provider prefix
        # (google_project.html.markdown); don't double-prefix those.
        def _with_prefix(s: str) -> str:
            return s if (prefix and s.startswith(prefix)) else f"{prefix}{s}"

        resources = []
        for markdown_file in docs_dir.glob('*.html.markdown'):
            stem = markdown_file.stem.replace('.html', '')

            if stem.endswith('_iam'):
                # IAM files document 3 resource variants in one file
                iam_names = self._extract_iam_resource_names(markdown_file, prefix)
                if iam_names:
                    resources.extend(iam_names)
                else:
                    # Fallback: synthesize the 3 standard names
                    base = _with_prefix(stem)
                    resources.extend([f"{base}_policy", f"{base}_binding", f"{base}_member"])
            else:
                resources.append(_with_prefix(stem))

        logger.debug(f"Found {len(resources)} resources in {docs_dir}")
        return sorted(resources)

    def _extract_iam_resource_names(self, iam_file: Path, prefix: str) -> List[str]:
        """Read an IAM markdown file and return the 3 resource names from its ## headers."""
        try:
            content = iam_file.read_text(encoding='utf-8')
            pattern = re.compile(
                r'^##\s+(' + re.escape(prefix) + r'\S+_iam_(?:policy|binding|member|audit_config))\s*$',
                re.MULTILINE
            )
            names = list(dict.fromkeys(pattern.findall(content)))  # preserve order, deduplicate
            return names
        except Exception:
            return []
    
    def list_resources_by_service(
        self,
        repo_path: Path,
        service: str
    ) -> List[str]:
        """
        List resources filtered by service subcategory.
        
        Parses the YAML frontmatter of each resource markdown file to extract
        the subcategory field, then filters resources matching the specified service.
        
        Args:
            repo_path: Path to the provider repository
            service: Service name to filter by (e.g., 'S3', 'EC2')
        
        Returns:
            List[str]: List of resource names in the specified service
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> repo_path = repo_mgr.clone_provider_repo('aws')
            >>> s3_resources = repo_mgr.list_resources_by_service(repo_path, 'S3')
            >>> print(s3_resources)  # ['aws_s3_bucket', 'aws_s3_bucket_acl', ...]
        
        Note:
            - Service matching is case-insensitive and partial
            - 'S3' matches 'S3 (Simple Storage)', 'S3', etc.
            - Requires parsing each markdown file to read subcategory
        """
        all_resources = self.list_all_resources(repo_path)
        filtered_resources = []
        
        # Normalize by stripping all spaces and underscores for robust matching:
        # "beyond_corp" → "beyondcorp" matches subcategory "BeyondCorp" → "beyondcorp"
        # "cloud_storage" → "cloudstorage" matches subcategory "Cloud Storage" → "cloudstorage"
        service_normalized = service.lower().replace('_', '').replace(' ', '')

        for resource_name in all_resources:
            try:
                markdown_path = self.get_resource_markdown_path(repo_path, resource_name)
                resource = parse_resource_markdown(markdown_path, resource_name_hint=resource_name)

                if resource and resource.subcategory:
                    subcategory_normalized = resource.subcategory.lower().replace('_', '').replace(' ', '')
                    if service_normalized in subcategory_normalized:
                        filtered_resources.append(resource_name)

                        
            except Exception as e:
                logger.warning(
                    f"Failed to parse {resource_name} for service filtering: {e}"
                )
                continue
        
        logger.info(
            f"Found {len(filtered_resources)} resources in service '{service}' "
            f"out of {len(all_resources)} total resources"
        )
        
        return sorted(filtered_resources)
