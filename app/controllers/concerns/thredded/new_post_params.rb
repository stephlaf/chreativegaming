# frozen_string_literal: true

module Thredded
  # @api private
  module NewPostParams
    protected

    def new_post_params
      params.fetch(:post, {})
        .permit(:content, :quote_post_id, :priority_post, :status)
        .tap do |p|
          # p[:priority_post] = p[:priority_post] == '1' ? true : false
          unless p[:status].nil?
            case p[:status].downcase
            when 'regular'   then p[:status] = 0
            when 'priority'  then p[:status] = 1
            when 'published' then p[:status] = 2
            end
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
