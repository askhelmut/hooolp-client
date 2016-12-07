require "byebug"

module Hoolp
  module Resource
    class Event
      MEDIA_BASE_URL = "http://hooolp.com".freeze

      def initialize(raw_event)
        @raw_event = raw_event
      end

      def id
        @raw_event.fetch("id")
      end

      def starts_at
        Time.parse(@raw_event.fetch("startDate")).utc
      end

      def title
        @raw_event.fetch("acts")
      end

      def description
        @raw_event.fetch("addText")
      end

      def image_urls
        @raw_event.fetch("bandFotos").map do |image_path|
          [MEDIA_BASE_URL, image_path].join
        end
      end

      def genres
        @raw_event.fetch("genresCsv").split(",").map(&:strip)
      end
    end
  end
end
