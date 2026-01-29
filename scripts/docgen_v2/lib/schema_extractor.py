"""
Schema Extractor for Terraform Resources

Coordinates the Repository Manager and Markdown Parser to extract complete
resource schemas from Terraform provider documentation. Sets metadata fields
and provides batch extraction capabilities.

Features:
    - Extract single resource schemas with metadata
    - List available resources (all or by service)
    - Batch extraction with error handling
    - Provider and version metadata tracking

Example:
    >>> from scripts.docgen_v2.schema_extractor import SchemaExtractor
    >>> from scripts.docgen_v2.repository_manager import RepositoryManager
    >>> 
    >>> repo_mgr = RepositoryManager()
    >>> extractor = SchemaExtractor(repo_mgr)
    >>> resource = extractor.extract_resource_schema('aws', 'aws_s3_bucket', '5.70.0')
    >>> print(f"{resource.resource_name} - {resource.provider} v{resource.version}")

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

from pathlib import Path
from typing import List, Optional
from scripts.docgen_v2.lib.models import Resource
from scripts.docgen_v2.lib.repository_manager import RepositoryManager
from scripts.docgen_v2.lib.parser import parse_resource_markdown
from scripts.docgen_v2.lib.logging_config import get_logger

logger = get_logger(__name__)


class SchemaExtractor:
    """
    Extracts Terraform resource schemas from provider documentation.
    
    Coordinates the Repository Manager for accessing provider documentation
    and the Markdown Parser for extracting schema information. Sets provider
    and version metadata on extracted resources.
    
    Attributes:
        repo_manager (RepositoryManager): Manager for provider repository access
    
    Example:
        >>> repo_mgr = RepositoryManager()
        >>> extractor = SchemaExtractor(repo_mgr)
        >>> resource = extractor.extract_resource_schema('aws', 'aws_s3_bucket')
        >>> print(resource.resource_name)  # 'aws_s3_bucket'
    """
    
    def __init__(self, repo_manager: RepositoryManager):
        """
        Initialize the schema extractor.
        
        Args:
            repo_manager: Repository manager instance for accessing provider docs
        """
        self.repo_manager = repo_manager
        logger.debug("Schema extractor initialized")
    
    def extract_resource_schema(
        self,
        csp: str,
        resource_name: str,
        version: Optional[str] = None
    ) -> Optional[Resource]:
        """
        Extract schema for a single Terraform resource.
        
        Clones/accesses the provider repository, locates the resource's
        markdown documentation, parses it, and sets metadata fields.
        
        Args:
            csp: Cloud service provider ('aws', 'azure', or 'gcp')
            resource_name: Full resource name (e.g., 'aws_s3_bucket')
            version: Optional provider version (e.g., '5.70.0')
        
        Returns:
            Resource object with complete schema and metadata, or None if extraction fails
        
        Raises:
            ValueError: If CSP is not supported
            FileNotFoundError: If resource markdown file doesn't exist
        
        Example:
            >>> extractor = SchemaExtractor(RepositoryManager())
            >>> resource = extractor.extract_resource_schema('aws', 'aws_s3_bucket', '5.70.0')
            >>> if resource:
            ...     print(f"Extracted {len(resource.arguments)} arguments")
        
        Note:
            - Sets resource.provider to the CSP value
            - Sets resource.version to the specified version (or None)
            - Returns None if parsing fails (errors are logged)
        """
        try:
            # Clone/access provider repository
            logger.debug(f"Extracting schema for {resource_name} from {csp} provider")
            repo_path = self.repo_manager.clone_provider_repo(csp, version)
            
            # Get markdown file path
            markdown_path = self.repo_manager.get_resource_markdown_path(
                repo_path,
                resource_name
            )
            
            # Parse the markdown file
            resource = parse_resource_markdown(markdown_path)
            
            if resource is None:
                logger.error(f"Failed to parse resource {resource_name}")
                return None
            
            # Set metadata fields
            resource.provider = csp
            resource.version = version
            
            logger.info(
                f"Successfully extracted schema for {resource_name} "
                f"({len(resource.arguments)} top-level arguments)"
            )
            
            return resource
            
        except FileNotFoundError as e:
            logger.error(f"Resource markdown file not found: {resource_name} - {e}")
            return None
        except Exception as e:
            logger.error(f"Error extracting schema for {resource_name}: {e}")
            return None
    
    def list_available_resources(
        self,
        csp: str,
        service: Optional[str] = None,
        version: Optional[str] = None
    ) -> List[str]:
        """
        List available resources for a provider, optionally filtered by service.
        
        Args:
            csp: Cloud service provider ('aws', 'azure', or 'gcp')
            service: Optional service name to filter by (e.g., 'S3', 'EC2')
            version: Optional provider version (e.g., '5.70.0')
        
        Returns:
            List of resource names (with provider prefix)
        
        Raises:
            ValueError: If CSP is not supported
        
        Example:
            >>> extractor = SchemaExtractor(RepositoryManager())
            >>> # List all AWS resources
            >>> all_resources = extractor.list_available_resources('aws')
            >>> print(f"Found {len(all_resources)} AWS resources")
            >>> 
            >>> # List only S3 resources
            >>> s3_resources = extractor.list_available_resources('aws', service='S3')
            >>> print(f"Found {len(s3_resources)} S3 resources")
        
        Note:
            - If service is None, returns all resources for the provider
            - Service filtering requires parsing frontmatter of each resource
            - Results are sorted alphabetically
        """
        try:
            # Clone/access provider repository
            repo_path = self.repo_manager.clone_provider_repo(csp, version)
            
            # List resources (filtered by service if specified)
            if service:
                logger.debug(f"Listing resources for {csp} provider, service: {service}")
                resources = self.repo_manager.list_resources_by_service(
                    repo_path,
                    service
                )
            else:
                logger.debug(f"Listing all resources for {csp} provider")
                resources = self.repo_manager.list_all_resources(repo_path)
            
            logger.info(f"Found {len(resources)} resources for {csp}" + 
                       (f" in service {service}" if service else ""))
            
            return resources
            
        except Exception as e:
            logger.error(f"Error listing resources for {csp}: {e}")
            return []
    
    def extract_all_resources(
        self,
        csp: str,
        version: Optional[str] = None,
        service: Optional[str] = None,
        resource_names: Optional[List[str]] = None
    ) -> List[Resource]:
        """
        Extract schemas for multiple resources in batch.
        
        Processes multiple resources with error isolation - if one resource
        fails to parse, the others continue processing. Failed resources are
        logged but don't stop the batch operation.
        
        Args:
            csp: Cloud service provider ('aws', 'azure', or 'gcp')
            version: Optional provider version (e.g., '5.70.0')
            service: Optional service name to filter by (e.g., 'S3')
            resource_names: Optional explicit list of resource names to extract.
                          If None, extracts all resources (or all in service if specified)
        
        Returns:
            List of successfully extracted Resource objects
        
        Example:
            >>> extractor = SchemaExtractor(RepositoryManager())
            >>> # Extract all S3 resources
            >>> resources = extractor.extract_all_resources('aws', service='S3')
            >>> print(f"Extracted {len(resources)} S3 resources")
            >>> 
            >>> # Extract specific resources
            >>> specific = extractor.extract_all_resources(
            ...     'aws',
            ...     resource_names=['aws_s3_bucket', 'aws_s3_bucket_acl']
            ... )
        
        Note:
            - Error isolation: individual failures don't stop batch processing
            - Failed resources are logged with ERROR level
            - Returns only successfully extracted resources
            - Progress is logged at INFO level
        """
        # Determine which resources to extract
        if resource_names is None:
            resource_names = self.list_available_resources(csp, service, version)
        
        if not resource_names:
            logger.warning(f"No resources found to extract for {csp}")
            return []
        
        logger.info(f"Starting batch extraction of {len(resource_names)} resources")
        
        extracted_resources = []
        failed_count = 0
        
        for i, resource_name in enumerate(resource_names, 1):
            logger.debug(f"Processing resource {i}/{len(resource_names)}: {resource_name}")
            
            resource = self.extract_resource_schema(csp, resource_name, version)
            
            if resource:
                extracted_resources.append(resource)
            else:
                failed_count += 1
                logger.error(f"Failed to extract resource {resource_name}")
        
        # Log summary
        success_count = len(extracted_resources)
        logger.info(
            f"Batch extraction complete: {success_count} succeeded, "
            f"{failed_count} failed out of {len(resource_names)} total"
        )
        
        return extracted_resources
