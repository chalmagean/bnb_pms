require "rails_helper"

RSpec.describe RegistrationForm, type: :model do
  it "validate the user model" do
    form = RegistrationForm.new
    form.valid?
    expect(form.errors.messages[:email]).to include("can't be blank")
    expect(form.errors.messages[:password]).to include("can't be blank")
    expect(form.errors.messages[:first_name]).to include("can't be blank")
    expect(form.errors.messages[:last_name]).to include("can't be blank")
  end

  it "validate the account model" do
    form = RegistrationForm.new
    form.valid?
    expect(form.errors.messages[:account_name]).to include("can't be blank")
  end

  it "validate the property model" do
    form = RegistrationForm.new
    form.valid?
    expect(form.errors.messages[:property_name]).to include("can't be blank")
    expect(form.errors.messages[:property_address]).to include("can't be blank")
    expect(form.errors.messages[:property_email]).to include("can't be blank")
  end

  describe "#user" do
    it "returns a new user instance" do
      form = RegistrationForm.new(
        first_name: "John",
        last_name: "Doe",
        email: "joe@email.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(form.user).to be_a_new(User)
    end
  end

  describe "#account" do
    it "returns a new account instance" do
      form = RegistrationForm.new(account_name: "Acme Inc.")
      expect(form.account).to be_a_new(Account)
    end
  end

  describe "#property" do
    it "returns a new property instance" do
      form = RegistrationForm.new(
        property_name: "My Property",
        property_address: "Main Str. 123",
        property_email: "prop@email.com"
      )
      expect(form.property).to be_a_new(Property)
    end
  end

  describe "#save" do
    it "saves all models if they're valid" do
      form = RegistrationForm.new(
        first_name: "John",
        last_name: "Doe",
        email: "joe@email.com",
        password: "password",
        password_confirmation: "password",
        property_name: "My Property",
        property_address: "Main Str. 123",
        property_email: "prop@email.com",
        account_name: "Acme Inc."
      )
      form.save
      expect(User.count).to eq(1)
      expect(Account.count).to eq(1)
      expect(Property.count).to eq(1)
    end

    context "when account data is missing" do
      it "does not save any of the models" do
        form = RegistrationForm.new(
          first_name: "John",
          last_name: "Doe",
          email: "joe@email.com",
          password: "password",
          password_confirmation: "password",
          property_name: "My Property",
          property_address: "Main Str. 123",
          property_email: "prop@email.com"
        )
        form.save
        expect(User.count).to eq(0)
        expect(Account.count).to eq(0)
        expect(Property.count).to eq(0)
      end
    end

    context "when property data is missing" do
      it "does not save any of the models" do
        form = RegistrationForm.new(
          first_name: "John",
          last_name: "Doe",
          email: "joe@email.com",
          password: "password",
          password_confirmation: "password",
          account_name: "Acme Inc."
        )
        form.save
        expect(User.count).to eq(0)
        expect(Account.count).to eq(0)
        expect(Property.count).to eq(0)
      end
    end

    context "when user data is missing" do
      it "does not save any of the models" do
        form = RegistrationForm.new(
          property_name: "My Property",
          property_address: "Main Str. 123",
          property_email: "prop@email.com",
          account_name: "Acme Inc."
        )
        form.save
        expect(User.count).to eq(0)
        expect(Account.count).to eq(0)
        expect(Property.count).to eq(0)
      end
    end
  end
end
