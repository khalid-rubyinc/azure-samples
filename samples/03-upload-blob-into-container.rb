#!/usr/bin/env ruby

# wget http://download.wavetlan.com/SVV/Media/HTTP/H264/Talkinghead_Media/H264_test3_Talkingheadclipped_mp4_480x360.mp4

media_file_name = 'H264_test3_Talkingheadclipped_mp4_480x360.mp4'

require 'azure'

Azure.config.storage_account_name = "mediasvc08bm49x890xlh"
Azure.config.storage_access_key   = "H0o3j/luiP1MulSD679c2KHUJwyTCY/ovKGsHewA7fP0k4ev0/aKtr323sR6oumkD1nFsXOgEMzM937RVrEtNA=="

azure_blob_service = Azure::BlobService.new

content = File.open(media_file_name, "rb") { |file| file.read }

container = azure_blob_service.get_container_properties('test-container')

blob = azure_blob_service.create_block_blob(
  container.name,
  media_file_name,
  content)

puts blob.name
