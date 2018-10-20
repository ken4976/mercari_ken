# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
def facebook
    callback_from :facebook
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    @users = User.find_for_oauth(request.env['omniauth.auth'])

    if @users.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @users, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
