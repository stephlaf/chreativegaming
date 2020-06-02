# frozen_string_literal: true

module Thredded
  # @api private
  module NewPostParams
    protected

    def new_post_params
      # raise
      params.fetch(:post, {})
        .permit(:content, :quote_post_id, :priority_post)
        .tap do |p|
        p[:priority_post] = p[:priority_post] == '1' ? true : false
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
