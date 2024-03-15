class RegistrationForm
  include ActiveModel::Model

  attr_accessor(
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

  validate :user_valid?
  validate :account_valid?
  validate :property_valid?

  def account
    @account ||= Account.new(name: account_name)
  end

  def user
    @user ||= User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )
  end

  def property
    @property ||= Property.new(
      name: property_name,
      address: property_address,
      email: property_email
    )
  end

  private

    def user_valid?
      unless user.valid?
        user.errors.each do |error|
          errors.add(error.attribute.to_sym, error.message)
        end
      end
    end

    def account_valid?
      unless account.valid?
        account.errors.each do |error|
          attr = "account_#{error.attribute}".to_sym
          errors.add(attr, error.message)
        end
      end
    end

    def property_valid?
      unless property.valid?
        property.errors.each do |error|
          attr = "property_#{error.attribute}".to_sym
          errors.add(attr, error.message)
        end
      end
    end
end
