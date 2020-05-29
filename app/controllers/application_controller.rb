class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user


    rescue_from CanCan::AccessDenied do |exception|
        @error_message = exception.message
        # respond_to do |f|
        render json: 'Your not authorize to take this action!', status: 401
        # end
    end
    private

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
