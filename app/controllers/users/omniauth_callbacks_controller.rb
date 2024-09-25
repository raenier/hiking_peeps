# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      set_flash_message(:notice, :failure, kind: 'Github', reason: @user.errors.full_messages.join(' '))
      redirect_to new_user_session_url
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      set_flash_message(:notice, :failure, kind: 'Google', reason: @user.errors.full_messages.join(', '))
      redirect_to new_user_session_url
    end
  end

  def failure
    redirect_to root_path
  end
end
