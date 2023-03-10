# frozen_string_literal: true

class UsersController < StoreController
  skip_before_action :set_current_order, only: :show, raise: false
  prepend_before_action :authorize_actions, only: :new

  include Taxonomies

  PALETTE = {
    1 => 'Red, Blue, Yellow',
    2 => 'Mustard, Magenta',
    3 => 'Red, Pink, Purple',
    4 => 'Pastels: Pink, Blue, Lavender',
    5 => 'Brown, Green, Yellow, Blue, Sand',
    6 => 'Black, Gray, Navy, White',
    7 => 'Beige, Brown, Blue'
  }

  FAV_STYLE = {
    1 => 'Casual',
    2 => 'Chic',
    3 => 'Classic',
    4 => 'Minimalist',
    5 => 'Business',
    6 => 'Athleisure',
    7 => 'Glam'
  }

  def show
    load_object
    @orders = @user.orders.complete.order('completed_at desc')
    @colors = PALETTE[@user.color_palette]
    @fav_style = FAV_STYLE[@user.style]
  end

  def create
    @user = Spree::User.new(user_params)
    if @user.save

      if current_order
        session[:guest_token] = nil
      end

      redirect_back_or_default(root_url)
    else
      render :new
    end
  end

  def edit
    load_object
  end

  def update
    load_object
    if @user.update(user_params)
      spree_current_user.reload
      redirect_url = account_url

      if params[:user][:password].present?
        # this logic needed b/c devise wants to log us out after password changes
        if Spree::Auth::Config[:signout_after_password_change]
          redirect_url = login_url
        else
          bypass_sign_in(@user)
        end
      end
      redirect_to redirect_url, notice: I18n.t('spree.account_updated')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(Spree::PermittedAttributes
          .user_attributes | %i[email due_date color_palette height style])
  end

  def load_object
    @user ||= Spree::User.find_by(id: spree_current_user&.id)
    authorize! params[:action].to_sym, @user
  end

  def authorize_actions
    authorize! params[:action].to_sym, Spree::User.new
  end

  def accurate_title
    I18n.t('spree.my_account')
  end
end
