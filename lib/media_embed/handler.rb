require_relative 'youtube'
require_relative 'vimeo'
require_relative 'soundcloud'

module MediaEmbed
  module Handler
    CODE = -1

    def embed(url)
      return choose_class(url)
    end

    private

    def choose_class(url)
      if match = youtube?(url)
         MediaEmbed::Youtube.new(url, match[CODE])
       elsif match = vimeo?(url)
         MediaEmbed::Vimeo.new(url, match[CODE])
       elsif match = soundcloud?(url)
         MediaEmbed::SoundCloud.new(url, match[CODE])
       else
         nil
       end
    end

    def youtube?(url)
      url.match youtube_regex
    end

    def vimeo?(url)
      url.match vimeo_regex
    end

    def soundcloud?(url)
      url.match soundcloud_regex
    end

    def youtube_regex
      /youtu(\.be|be\.com)\/(watch\?v=|embed\/|)([^?\s]*)/
    end

    def vimeo_regex
      /vimeo\.com\/(channels\/\D*|groups\/\D*|album\/\d*\/video\/|video\/|)([^?\s]*)/
    end

    def soundcloud_regex
      /soundcloud.com\/(.*\/[a-zA-Z0-9\-\_]*)/
    end
  end
end

