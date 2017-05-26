class Page < ApplicationRecord
  include Picturable
  picture_fields({ file: [:s3_file_url, :default_picture, :file_name] })

  has_one :comic

  validates :s3_file_url, presence: true

  def default_picture
    ActionController::Base.helpers.image_url("gplaypattern.png")
  end

  def file_name
    [id]
  end
end
