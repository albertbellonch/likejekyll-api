module Identification
  extend ActiveSupport::Concern

  included do
    serialization_scope :identity
  end

  protected

  def identity
    @identity ||= Identity.find_or_create_by(ip: request.remote_ip)
  end
end
