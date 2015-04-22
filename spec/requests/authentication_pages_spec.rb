require 'rails_helper'

describe "Authentication pages" do

  subject { page }

  describe "signup page" do

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
        fill_in "Password",               with: "foobarrr"
        fill_in "Password confirmation",  with: "foobarrr"
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

  describe "log in page" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Log in" }

    it { should have_content('Log in') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_selector('h3', text: "Listing Products") }
      it { should have_content(user.name) }
      it { should have_content(user.email) }
      it { should have_content(user.phone) }
      it { should have_link("Sign out") }
      it { should have_link("Edit my profile") }
      it { should have_button("Add new product") }
      it { should have_button("Show orders") }
    end
  end
end