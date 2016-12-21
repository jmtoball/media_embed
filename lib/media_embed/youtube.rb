require_relative 'video'

module MediaEmbed
  class Youtube < Video
    def html(options = {})
      return iframe("#{embed_url}enablejsapi=1", options)
    end

    def url
      "https://www.youtube.com/watch?v=#{@code}"
    end

    def embed_url
      "https://www.youtube.com/embed/#{@code}/"
    end

    def thumbnail_url
      "https://img.youtube.com/vi/#{@code}/0.jpg"
    end
  end
end
