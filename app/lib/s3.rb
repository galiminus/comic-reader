class S3
  require 'base64'
  require 'hmac-sha1'

  def self.sign_data(details_to_sign)
    hmac = HMAC::SHA1.new(ENV['DIRECT_UPLOAD_AWS_SECRET_ACCESS_KEY'])
    hmac.update(details_to_sign)

    Base64.encode64("#{hmac.digest}").gsub("\n",'')
  end
end
