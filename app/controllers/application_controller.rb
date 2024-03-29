class ApplicationController < ActionController::Base
  def current_account
    current_user.account
  end
  helper_method :current_account

  def current_property
    current_account.property
  end
  helper_method :current_property
end
