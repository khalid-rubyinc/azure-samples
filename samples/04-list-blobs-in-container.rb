#!/usr/bin/env ruby

require 'azure'

Azure.config.storage_account_name = "mediasvc08bm49x890xlh"
Azure.config.storage_access_key   = "H0o3j/luiP1MulSD679c2KHUJwyTCY/ovKGsHewA7fP0k4ev0/aKtr323sR6oumkD1nFsXOgEMzM937RVrEtNA=="

azure_blob_service = Azure::BlobService.new

containers = azure_blob_service.list_containers()
containers.each do |container|
  blobs = azure_blob_service.list_blobs(container.name)
  puts container.name
  blobs.each do |blob|
    puts "  " + blob.name
  end
end
