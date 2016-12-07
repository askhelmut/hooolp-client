module Hoolp
  class Client
    include HTTParty

    USER_AGENT = "ASK HELMUT Hooolp Client #{VERSION}".freeze
    DEFAULT_OPTIONS = {
      base_url: "http://api2.hooolp.com"
    }.freeze

    attr_accessor :options

    headers("User-Agent" => USER_AGENT)

    def initialize(options)
      store_options(options)
    end

    def events(location_id:)
      query = construct_query_arguments(
        resource: "events",
        options: "locations=#{location_id}&ctr=DE"
      )

      response = self.class.get(
        *query
      )

      result = JSON.parse(response.body)

      raise ApiError(result) if !result.is_a?(Array) && result.key?("error")

      result.map do |item|
        Resource::Event.new(item.fetch("event"))
      end
    end

    def base_url
      @options.fetch(:base_url)
    end

    def api_key
      @options.fetch(:api_key)
    end

    private

    def store_options(options)
      @options ||= DEFAULT_OPTIONS.dup
      @options.merge!(options)
    end

    def handle_response(&block)
      response = yield block
      ResponseWrapper.new(response)
    end

    def construct_query_arguments(resource:, options:)
      [
        "#{base_url}/#{resource}.json?#{options}&key=#{api_key}"
      ]
    end
  end
end
