module Hoolp
  class ApiError < StandardError
    def initialize(response_body)
      super(response_body.fetch("error"))
    end
  end
end
