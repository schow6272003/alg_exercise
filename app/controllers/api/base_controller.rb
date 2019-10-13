class Api::BaseController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include Api::Requestable
    include Api::Responsable
end