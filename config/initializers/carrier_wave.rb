# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       # Configuration for Amazona S3
#       :provider => 'AWS',
#       :aws_access_key_id => ENV['S3_ACCESS_KEY'],
#       :aws_secret_access_key => ENV['S3_SECRET_KEY']
#     }
#     config.fog_directory = ENV['S3_BUCKET']
#     # may need to include:
#     config.fog_provider = 'fog/aws'
#   end
# end


 # For deployment on heroku, will need to explicitly set the info
 # on the S3_..._KEY's and BUCKET. Use heroku config:set like this:

 #      heroku config:set S3_ACCESS_KEY=<access key>
 #      heroku config:set S3_SECRET_KEY=<secret key>
 #      heroku config:set S3_BUCKET=<bucket name
