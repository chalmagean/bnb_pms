require 'rails_helper'

RSpec.describe "Welcomes", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "loads the welcome page" do
    visit root_path
    expect(page).to have_text("Welcome")
  end
end
