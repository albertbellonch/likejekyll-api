module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end

    def mock_request_ip(ip)
      allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return(ip)
    end
  end
end
