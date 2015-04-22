require 'rails_helper'

  describe "Welcome page" do

    subject { page }

    describe "for guests" do
      before { visit root_path }

      it { should have_content('Welcome to DEPOT') }
      it { should have_link('Depot') }
      it { should have_link('Log in') }
      it { should have_link('Sign up') }
      it { should have_button('SELL') }
      it { should have_button('BUY') }

      describe "check links" do
        it "should have the right links on the layout" do
        visit root_path
        click_link "Depot"
        expect(page).to have_content("Welcome to DEPOT")
        click_link "Log in"
        expect(page).to have_content("Log in")
        visit root_path
        find(:link, "Sign up").click
        expect(page).to have_content("Sign")
        visit root_path
        find(:button, "SELL").click
        expect(page).to have_content("Sign up")
        visit root_path
        find(:button, "BUY").click
        expect(page).to have_content("Books Catalog")
        end
      end
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit root_path }

      it { should have_content('Welcome to DEPOT') }
      it { should have_link('Depot') }
      it { should have_link('Sign out') }
      it { should have_button('SELL') }
      it { should have_button('BUY') }

      describe "check links" do
        it "should have the right links on the layout" do

        visit root_path
        # click_link "Depot"
        # expect(page).to have_content("Welcome to DEPOT")
        # click_link "Log in"
        # expect(page).to have_content("Log in")
        # visit root_path
        # click_link "Sign up"
        # expect(page).to have_content("Sign up")
        # visit root_path
        # find(:button, "SELL").click
        # expect(page).to have_content("Sign")
        # visit root_path
        # find(:button, "BUY").click
        # expect(page).to have_content("Books Catalog")
        end
      end
    end
  end

