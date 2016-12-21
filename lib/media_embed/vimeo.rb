require_relative 'video'

module MediaEmbed
  class Vimeo < Video
    def html(options = {})
      return iframe(embed_url, options)
    end

    def url
      "https://vimeo.com/#{@code}"
    end

    def embed_url
      "https://player.vimeo.com/video/#{@code}"
    end

    def thumbnail_url
      vimeo_video_json_url = "http://vimeo.com/api/v2/video/#{@code}.json"
      JSON.parse(open(vimeo_video_json_url).read).first['thumbnail_large']
    end
  end
end
