module Requests
  module Helper
    def json
      JSON.parse(response.body)
    end
  end
end

RSpec.configure do |config|
  config.include Requests::Helper, type: :request
end
