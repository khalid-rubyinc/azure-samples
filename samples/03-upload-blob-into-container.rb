#!/usr/bin/env ruby

# wget http://download.wavetlan.com/SVV/Media/HTTP/H264/Talkinghead_Media/H264_test3_Talkingheadclipped_mp4_480x360.mp4

media_file_name = 'H264_test3_Talkingheadclipped_mp4_480x360.mp4'

require 'azure'

Azure.config.storage_account_name = "wiprolimited"
Azure.config.storage_access_key   = "RMyPBtvvMZ8fZxRhd+lonW5/ZP4sxlQfWFJrvxv9y/oANm4qH2ipfLqOp9Soc/z3UtN85Nm1yS3ikwS94HULMw=="

azure_blob_service = Azure::BlobService.new

content = File.open(media_file_name, "rb") { |file| file.read }

container = azure_blob_service.get_container_properties('test-container')

blob = azure_blob_service.create_block_blob(
  container.name,
  media_file_name,
  content)

puts blob.name
