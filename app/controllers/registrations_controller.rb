class RegistrationsController < Devise::RegistrationsController
  def new
    @registration_form = RegistrationForm.new
  end

  def create
    @registration_form = RegistrationForm.new(registration_params)

    if @registration_form.save
      sign_in("user", @registration_form.user)
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def registration_params
      params.require(:registration_form).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :property_name,
        :property_address,
        :property_email,
        :account_name
      )
    end
end
