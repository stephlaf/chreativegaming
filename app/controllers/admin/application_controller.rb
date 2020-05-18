# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.

module Admin
  class ApplicationController < Administrate::ApplicationController
    # include Administrate::Punditize

    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      unless current_user.master
        flash[:alert] = "You are not authorized to access this page."
        redirect_to root_path
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    # include Pundit

    # def policy_scope(scope)
    #   super([:admin, scope])
    # end

    # def authorize(record, query = nil)
    #   super([:admin, record], query)
    # end

    # def scoped_resource
    #   policy_scope super
    # end

    # def authorize_resource(resource)
    #   authorize resource
    # end

    # def show_action?(action, resource)
    #   Pundit.policy!(pundit_user, [:admin, resource]).send("#{action}?".to_sym)
    # end
  end
end
