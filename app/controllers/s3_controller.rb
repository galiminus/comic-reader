class S3Controller < ApplicationController
  def sign
    if params["to_sign"].split("\n").last.match(/^\/#{ENV['DIRECT_UPLOAD_S3_BUCKET']}\/#{current_user.id}\//)
      encoded = S3.sign_data(params["to_sign"])

      render plain: encoded, status: 200
    else
      head :bad_request
    end
  end
end
