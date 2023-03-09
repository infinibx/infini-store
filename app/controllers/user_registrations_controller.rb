# frozen_string_literal: true

class UserRegistrationsController < Devise::RegistrationsController
  before_action :check_permissions, only: [:edit, :update]
  skip_before_action :require_no_authentication

  def create
    build_resource(spree_user_params)
    if resource.save
      set_flash_message(:notice, :signed_up)
      sign_in(:spree_user, resource)
      session[:spree_user_signup] = true
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with(resource) do |format|
        format.html { render :new }
      end
    end
  end

  def user_choose_clothes
    build_resource({})
    respond_with self.resource
  end

  def stylist_choose_clothes
    build_resource({})
    respond_with self.resource
  end

  protected

  def translation_scope
    'devise.user_registrations'
  end

  def check_permissions
    authorize!(:create, resource)
  end

  private

  def spree_user_params
    params.require(:spree_user)
    .permit(Spree::PermittedAttributes
    .user_attributes | %i[email due_date color_palette height style])
  end
end
