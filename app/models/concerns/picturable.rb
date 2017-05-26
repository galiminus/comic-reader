module Picturable

  extend ActiveSupport::Concern

  included do
    def self.picture_fields(fields)
      fields.each do |name, config|
        field, default, file_name = config

        define_method "#{name}_url" do |format = :standard|
          params =
            case format
            when :original
              {}
            when :avatar
              {
                width: 256,
                height: 256,
                crop: :thumb
              }
            when :standard
              {
                width: 1000,
                height: 800,
                crop: :limit
              }
            when :banner
              {
                width: 1000,
                height: 300,
                crop: :fill
              }
            when :thumbnail
              {
                width: 420,
                height: 590,
                crop: :fill
              }
            end
          if send(field).present?
            params[:version] = ENV["IMAGE_SERVER_VERSION"] || 1
            params[:url] = URI.parse(send(field)).path.gsub(/^\//, '')

            full_file_name = "#{send(file_name).join(' ').parameterize.underscore}_#{format}#{File.extname(params[:url])}"
            "#{ENV['IMAGE_SERVER_BASE_URL']}#{full_file_name}?#{params.to_query}"
          else
            send(default)
          end
        end
      end
    end
  end
end
