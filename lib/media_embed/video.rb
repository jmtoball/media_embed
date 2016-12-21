require_relative 'media'

module MediaEmbed
  class Video < Media

    private

    def iframe(source, options = {})
      "<iframe src='#{source}' #{options.map { |key, value| "#{key}='#{value}'" }.join(' ')}></iframe>"
    end
  end
end

