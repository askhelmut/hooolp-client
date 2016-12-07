require "hashie"
require "httparty"
require "uri"

require "hoolp/version"
require "hoolp/api_error"
require "hoolp/client"
require "hoolp/resource/event"

module Hoolp
  def new(api_key:)
    @client = Client.new(api_key: api_key)
  end
  module_function :new

  def events(location_id:)
    @client.events(location_id: location_id)
  end
end
