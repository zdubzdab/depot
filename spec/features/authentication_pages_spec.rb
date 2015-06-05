require 'rails_helper'

describe "Authentication pages" do

  subject { page }

  describe "signup" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",                   with: "Example User"
        fill_in "Email",                  with: "user@example.com"
        fill_in "Phone",                  with: "530099"
        fill_in "Password",               with: "password"
        fill_in "Password confirmation",  with: "password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_content(user.name) }
      end
    end
  end

  describe "log in" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_content('Log in') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }

      it { should have_link("Sign out") }
      it { should have_selector('h3', text: "Listing Products") }
      it { should have_content(user.name) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Log in') }
      end
    end
  end
end