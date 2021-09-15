class Users::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    attach_default_avatar
    root_path
  end

  def attach_default_avatar
    file = URI.open('https://res.cloudinary.com/chreative-gaming/image/upload/v1583507597/default_junymf.png')
    if current_user
      unless current_user.avatar.attached?
        current_user.avatar.attach(io: file, filename: 'default.png', content_type: 'image/png')
        current_user.save!
      end
    end
  end
end
