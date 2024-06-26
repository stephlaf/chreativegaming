class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception#, prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized if Rails.env.production?
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  after_action :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session["user_return_to"] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    if resource.master
      stored_location_for(resource)
    else
      super
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gametag, :gamer_type])

    # For additional in app/views/devise/registrations/edit.html.erb
    update_attrs = [:gametag, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  end

  private

  def skip_pundit?
    # devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    devise_controller? || params[:controller] =~ /(^pages$)/
  end
end
