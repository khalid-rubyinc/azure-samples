#!/usr/bin/env ruby

require 'azure'

Azure.config.storage_account_name = "mediasvc08bm49x890xlh"
Azure.config.storage_access_key   = "H0o3j/luiP1MulSD679c2KHUJwyTCY/ovKGsHewA7fP0k4ev0/aKtr323sR6oumkD1nFsXOgEMzM937RVrEtNA=="

azure_blob_service = Azure::BlobService.new
begin
  container = azure_blob_service.create_container("test-container")
rescue
  puts $!
end
