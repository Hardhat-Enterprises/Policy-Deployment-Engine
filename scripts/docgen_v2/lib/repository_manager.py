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
            
            # If not on a tag, get the latest tag
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'describe', '--tags', '--abbrev=0'],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0:
                version = result.stdout.strip()
                logger.info(f"Detected version from latest tag: {version}")
                return version
            
            # If no tags exist, try to get the most recent tag from all branches
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'tag', '--sort=-version:refname'],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0 and result.stdout.strip():
                # Get the first (most recent) tag
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
    
    def update_cache(self, repo_path: Path) -> None:
        """
        Update cached repository from remote.
        
        Performs a full git pull to update the cached repository with
        the latest documentation from the remote. This ensures the cache
        has the most recent provider documentation.
        
        Args:
            repo_path: Path to the git repository
        
        Raises:
            ConnectionError: If git pull fails
        
        Example:
            >>> repo_mgr = RepositoryManager()
            >>> repo_path = repo_mgr.clone_provider_repo('aws')
            >>> repo_mgr.update_cache(repo_path)
        
        Note:
            - Performs full git pull (updates all files in sparse checkout)
            - May take 10-30 seconds depending on changes
            - Only updates files in sparse checkout (website/docs/r/)
            - Switches to main branch if in detached HEAD state
        """
        try:
            logger.info("Updating cache from remote...")
            
            # First, ensure we're on main branch (not detached HEAD)
            subprocess.run(
                ['git', '-C', str(repo_path), 'checkout', 'main'],
                check=True,
                capture_output=True,
                text=True
            )
            
            # Pull latest changes
            result = subprocess.run(
                ['git', '-C', str(repo_path), 'pull', 'origin', 'main'],
                check=True,
                capture_output=True,
                text=True
            )
            
            logger.info("Cache updated successfully")
            logger.debug(f"Git pull output: {result.stdout}")
            
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
        
        resources = []
        for markdown_file in docs_dir.glob('*.html.markdown'):
            # Extract resource name from filename
            resource_name = markdown_file.stem.replace('.html', '')
            full_resource_name = f"{prefix}{resource_name}"
            resources.append(full_resource_name)
        
        logger.debug(f"Found {len(resources)} resources in {docs_dir}")
        return sorted(resources)
    
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
        
        service_lower = service.lower()
        
        for resource_name in all_resources:
            try:
                markdown_path = self.get_resource_markdown_path(repo_path, resource_name)
                resource = parse_resource_markdown(markdown_path)
                
                if resource and resource.subcategory:
                    # Case-insensitive partial match
                    if service_lower in resource.subcategory.lower():
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
