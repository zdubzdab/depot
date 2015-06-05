require 'rails_helper'

describe "Sell pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { visit new_user_session_path }
  before { valid_signin(user) }

  describe "create product" do
    before { visit new_product_path }

    it { should have_content("New product") }

    describe "with invalid information" do
      before do
        fill_in "Title",        with: ""
        fill_in "Description",  with: "The best book in the world!"
        fill_in "Image url",    with: "logo.png"
        fill_in "Price",        with: 100.99
      end

      it "should not create a product" do
        expect { click_button "Create Product" }.not_to change(Product, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",        with: "Perfect book"
        fill_in "Description",  with: "The best book in the world!"
        fill_in "Image url",    with: "logo.png"
        fill_in "Price",        with: 100.99
      end

      it "should create a product" do
        expect { click_button "Create Product" }.to change(Product, :count).by(1)
      end

      describe "after saving the product" do
        before { click_button "Create Product" }
        let(:product) { Product.find_by(title: 'Perfect book') }

        it { should have_content('Listing Products') }
        it { should have_content(product.title) }
      end
    end
  end

  describe "edit product" do
    let!(:product) { FactoryGirl.create(:product, user: user) }
    before { visit edit_product_path(product) }

    it { should have_content("Editing product") }

    describe "with invalid information" do
      before do
        fill_in "Title",  with: ""
        click_button "Update Product"
      end

      it { should have_content('Editing product') }
      it { should have_content("Title can't be blank") }
    end

    describe "with valid information" do
      before do
        fill_in "Title",  with: "Health, Jewelery"
        click_button "Update Product"
      end

      it { should have_content('Product was successfully updated.') }
      it { should have_content("Health, Jewelery") }
    end
  end

  describe "check table links" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:product) { FactoryGirl.create(:product, user: user) }

    before { visit persons_profile_path }

    it { should have_content(product.title) }
    it { should have_content(user.name) }
    it "link should show product details" do
      click_link "Show"
      expect(page).to have_content(product.title)
      expect(page).to have_content(product.description)
      expect(page).to have_content(product.price)
    end
    it "link should show edit form" do
      visit persons_profile_path
      click_link "Edit"
      expect(page).to have_content("Editing product")
      expect(page).to have_button("Update Product")
    end
    it "link should delete a product" do
      visit persons_profile_path
      expect { click_link "Destroy" }.to change(Product, :count).by(-1)
    end
  end

  describe "edit profile" do
    before { visit edit_user_registration_path }

    it { should have_content("Edit User") }

    describe "with invalid information" do
      before do
        fill_in "Phone",             with: 555555
        fill_in "Current password",  with: ""
        click_button "Update"
      end

      it { should have_content('Edit User') }
      it { should have_content("Current password can't be blank") }
    end

    describe "with valid information" do
      before do
        fill_in "Phone",             with: 555555
        fill_in "Current password",  with: "password"
        click_button "Update"
      end

      it { should have_content('Your account has been updated successfully.') }
      it { should have_content(555555) }
      specify { expect(user.reload.phone).to  eq 555555 }
    end
  end

  describe "manage orders" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:order) { FactoryGirl.create(:order, user: user) }
    let!(:product) { FactoryGirl.create(:product, user: user) }
    let!(:line_item) { FactoryGirl.create(:line_item, product: product) }
    before { visit line_items_path }

    it { should have_content("Listing orders") }
    it { should have_link("Details") }
    it { should have_link("Change status") }
    it "link should show Change status page" do
      click_link "Change status"
      expect(page).to have_field("Status")
      expect(page).to have_button("Update Line item")
    end

    describe "change status" do
      before do
        visit edit_line_item_path(line_item) 
        select('in process')
        click_button 'Update Line item'
      end

      it { should have_content("in process") }
      specify { expect(line_item.reload.status).to  eq 'in process' }
    end
  end
end
