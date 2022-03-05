class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless /@gmail.com || @tamu.edu\z/.match?(email)
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def current_user
    @current_user ||= User.find(session[:email]) if session[:email]
  end

  def signed_in?
      !!current_user
  end

  def is_admin?
    signed_in? ? current_user.admin : false
  end

  def self.current_user_admin?(current_admin)
    user = Admin.where(email: current_admin.email).first

    permission = User.where(email: current_admin.email, isAdmin: true, isOfficer: true)

    !permission.nil?
  end
end