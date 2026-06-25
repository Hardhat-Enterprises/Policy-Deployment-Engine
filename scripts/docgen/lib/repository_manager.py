"""
Repository Manager for Terraform Provider Documentation

Manages cloning, caching, and accessing Terraform provider repositories
to extract resource documentation. Uses sparse checkout to minimize disk
space and clone time by only fetching the documentation directory.

Features:
    - Sparse checkout of website/docs/r/ directory only
    - Local caching to scripts/docgen/.cache/{csp}/
    - Version-specific checkout via git tags
    - Cache hit/miss logging for transparency
    - Support for AWS, Azure, and GCP providers

Cache Strategy:
    - Repos cached to scripts/docgen/.cache/{csp}/
    - Sparse checkout reduces size from 100-500MB to 10-50MB per provider
    - Cache persists across runs (no automatic cleanup)
    - To refresh: delete cache directory and re-run

Example:
    >>> from scripts.docgen.lib.repository_manager import RepositoryManager
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
from scripts.docgen.lib.logging_config import get_logger
from scripts.docgen.lib.errors import ConnectionError, ParsingError, ConfigurationError

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
                      scripts/docgen/.cache/
        """
        if cache_dir is None:
            # Default to scripts/docgen/.cache/ relative to this file
            current_file = Path(__file__)  # scripts/docgen/lib/repository_manager.py
            docgen_dir = current_file.parent.parent  # Go up 2 levels to scripts/docgen/
            cache_dir = docgen_dir / '.cache'
        
        self.cache_dir = cache_dir
        # Per-instance caches so each markdown file is located/read at most once per run
        # (build_service_map and MarkdownProcessor both need the same files).
        self._md_path_cache = {}   # (repo_path, resource_name) -> Path
        self._md_text_cache = {}   # str(path) -> text
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
            # Only hit the network when the tag isn't already present locally. The
            # offline provider/doc cache is seeded with tags, so on a cache hit this
            # avoids a `git fetch --tags` round-trip (which would also fail on hosts
            # with broken egress) on every run.
            tag_present = subprocess.run(
                ['git', '-C', str(repo_path), 'rev-parse', '-q', '--verify',
                 f'refs/tags/{version}'],
                capture_output=True,
                text=True
            ).returncode == 0
            if not tag_present:
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
            Results are memoized per (repo_path, resource_name) — the filename
            resolution stats several candidate paths, and both build_service_map
            and MarkdownProcessor resolve the same resources.
        """
        cache_key = (str(repo_path), resource_name)
        cached = self._md_path_cache.get(cache_key)
        if cached is not None:
            return cached
        result = self._locate_markdown(repo_path, resource_name)
        self._md_path_cache[cache_key] = result
        return result

    def read_resource_markdown(self, repo_path: Path, resource_name: str) -> str:
        """Return a resource's markdown text, reading each file at most once per run."""
        path = self.get_resource_markdown_path(repo_path, resource_name)
        key = str(path)
        if key not in self._md_text_cache:
            self._md_text_cache[key] = path.read_text(encoding='utf-8')
        return self._md_text_cache[key]

    def _locate_markdown(self, repo_path: Path, resource_name: str) -> Path:
        """Resolve a resource's markdown path (see get_resource_markdown_path)."""
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
                    # Strip the provider prefix to get the bare stem (e.g.
                    # google_folder -> folder); default to base if no prefix matches.
                    iam_stem = base
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
        except OSError as e:
            logger.warning(f"Could not read IAM markdown {iam_file}: {e}")
            return []

