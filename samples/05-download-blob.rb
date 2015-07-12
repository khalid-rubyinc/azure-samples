#!/usr/bin/env ruby

media_file_name = 'H264_test3_Talkingheadclipped_mp4_480x360.mp4'

require 'azure'

Azure.config.storage_account_name = "mediasvc08bm49x890xlh"
Azure.config.storage_access_key   = "H0o3j/luiP1MulSD679c2KHUJwyTCY/ovKGsHewA7fP0k4ev0/aKtr323sR6oumkD1nFsXOgEMzM937RVrEtNA=="

azure_blob_service = Azure::BlobService.new

container = azure_blob_service.get_container_properties('test-container')

blob, content = azure_blob_service.get_blob(container.name, media_file_name)
File.open(media_file_name,"wb") {|f| f.write(content)}
