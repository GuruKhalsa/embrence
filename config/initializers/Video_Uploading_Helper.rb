CarrierWave::Video::ClassMethods.module_eval do
	def encoding_video(target_format)
		process :encoding_video => [target_format]
	end
end

CarrierWave::Video.module_eval do
  def encoding_video(format='mp4')
      # move upload to local cache
      cache_stored_file! if !cached?
 
      tmp_path = File.join( File.dirname(current_path), "tmpfile.#{format}" )
      file = ::FFMPEG::Movie.new(current_path)
      # file.transcode(current_path, "-ss 00:00:14.435 -f image2 -vframes 1 test.png")
      file.transcode(tmp_path, "-ss 0.5 -vframes 1 -s 105x65 output.png")
      File.rename tmp_path, current_path
      
    end
end

# CarrierWave::Video.module_eval do
#  	def encoding_video(format='mp4')
#       # move upload to local cache
#       cache_stored_file! if !cached?
 
#       directory = File.dirname(current_path)
#       tmpfile = File.join(directory, "tmpfile")
#       FileUtils.move(current_path, tmpfile)
#       file = ::FFMPEG::Movie.new(tmpfile)
#       # file.transcode(current_path, "-ss 00:00:14.435 -f image2 -vframes 1 test.png")
#       file.transcode(current_path, "-ss 0.5 -vframes 1 -s 105x65 output.png")
      
#     end
# end