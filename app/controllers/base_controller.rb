class BaseController < ActionController::API
  include ActionController::Serialization

  include Identification

  respond_to :json
end
