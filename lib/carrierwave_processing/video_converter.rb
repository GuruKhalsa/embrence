# require 'streamio-ffmpeg'
# require 'carrierwave'

# module CarrierWave
#   module VideoConverter
#     extend ActiveSupport::Concern

#     included do
#       begin
#         require "mini_magick"
#       rescue LoadError => e
#         e.message << " (You may need to install the mini_magick gem)"
#         raise e
#       end
#     end

#     module ClassMethods
#       def encoding_video(target_format)
#         process :encoding_video => [target_format]
#       end
#     end
 
#     def encoding_video(format='mp4')
#       # move upload to local cache
#       cache_stored_file! if !cached?
 
#       directory = File.dirname( current_path )
 
#       # move upload to tmp file - encoding result will be saved to
#       # original file name
#       tmp_path   = File.join( directory, "tmpfile" )
#       File.rename current_path, tmp_path
 
#       # encode
#       file = ::FFMPEG::Movie.new(tmp_path)
#       file.transcode(current_path)
 
#       # because encoding video will change file extension, change it 
#       # to old one
#       fixed_name = File.basename(current_path, '.*') + "." + format.to_s
#       File.rename File.join( directory, fixed_name ), current_path
 
#       # delete tmp file
#       File.delete tmp_path
#     end
    
#     def gen_video_thumb(width, height)
#       directory = File.dirname(current_path)
#       tmpfile = File.join(directory, "tmpfile")
#       FileUtils.move(current_path, tmpfile)
#       file = ::FFMPEG::Movie.new(tmpfile)
#       file.transcode(current_path, "-ss 00:00:01 -an -r 1 -vframes 1 -s #{width}x#{height}")
#       FileUtils.rm(tmpfile)
#     end

#     def resize_to_fill(width, height, gravity = 'Center')
#       manipulate! do |img|
#         cols, rows = img[:dimensions]
#         img.combine_options do |cmd|
#           if width != cols || height != rows
#             scale_x = width/cols.to_f
#             scale_y = height/rows.to_f
#             if scale_x >= scale_y
#               cols = (scale_x * (cols + 0.5)).round
#               rows = (scale_x * (rows + 0.5)).round
#               cmd.resize "#{cols}"
#             else
#               cols = (scale_y * (cols + 0.5)).round
#               rows = (scale_y * (rows + 0.5)).round
#               cmd.resize "x#{rows}"
#             end
#           end
#           cmd.gravity gravity
#           cmd.background "rgba(255,255,255,0.0)"
#           cmd.extent "#{width}x#{height}" if cols != width || rows != height
#         end
#         img = yield(img) if block_given?
#         img
#       end
#     end

#     private
#       def prepare!
#         cache_stored_file! if !cached?
#       end
#   end
# end