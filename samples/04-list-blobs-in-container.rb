#!/usr/bin/env ruby

require 'azure'

Azure.config.storage_account_name = "wiprolimited"
Azure.config.storage_access_key   = "RMyPBtvvMZ8fZxRhd+lonW5/ZP4sxlQfWFJrvxv9y/oANm4qH2ipfLqOp9Soc/z3UtN85Nm1yS3ikwS94HULMw=="

azure_blob_service = Azure::BlobService.new

containers = azure_blob_service.list_containers()
containers.each do |container|
  blobs = azure_blob_service.list_blobs(container.name)
  puts container.name
  blobs.each do |blob|
    puts "  " + blob.name
  end
end
