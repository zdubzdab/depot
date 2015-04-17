require 'rails_helper'

# describe "Welcome page" do

#   it "should have the content 'depot'" do
#     visit 'users/sign_up'
#     expect(page).to have_content('sign')
#   end
# end

  describe "Welcome page" do

    subject { page }

    before { visit new_user_registration_path }

    it { should have_content('sign') }
    # it { should have_title("Ruby on Rails Tutorial Sample App") }
    # it { should_not have_title('| Home') }
  end

