# frozen_string_literal: true

module Thredded
  # @api private
  module NewPostParams
    protected

    def new_post_params
      # raise
      params.fetch(:post, {})
        .permit(:content, :quote_post_id, :priority_post, :status)
        .tap do |p|
        p[:priority_post] = p[:priority_post] == '1' ? true : false
        case p[:status]
        when 'Regular'   then p[:status] = 0
        when 'Priority'  then p[:status] = 1
        when 'Published' then p[:status] = 2
        end
        quote_id = p.delete(:quote_post_id)
        if quote_id
          post = Thredded::Post.find(quote_id)
          authorize_reading post
          p[:quote_post] = post
        end
      end
    end
  end
end
