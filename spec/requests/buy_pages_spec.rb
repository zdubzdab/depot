require 'rails_helper'

describe "Buy pages" do

  subject { page }

  describe "index page" do
    let!(:product) { FactoryGirl.create(:product) }
    before { visit store_index_path }

    it { should have_content('Books Catalog') }
    it { should have_content(product.title) }
    it { should have_button('Add to Cart') }

    it "should create a line_item" do
      expect { click_button "Add to Cart" }.to change(LineItem, :count).by(1)
    end

    it "button should show right line_item" do
      click_button "Add to Cart"
      expect(page).to have_content("Total")
      expect(page).to have_css '#cart', text: product.title
      expect(page).to have_button "Checkout"
      expect(page).to have_button "Empty cart"
    end

    describe "checkup cart's buttons" do
      before { click_button "Add to Cart" }

      describe "'Empty cart' button" do
          it "should remove line_item from cart" do
            expect { click_button "Empty cart" }.to change(LineItem, :count).by(-1)
          end
          it "should render empty cart" do
            click_button "Empty cart"
            expect(page).to have_content("Your Cart is empty.")
          end
        end

      describe "'Checkout' button" do
          it "should render orders form" do
            click_button "Checkout"
            expect(page).to have_content("Please Enter Your Details")
            expect(page).to have_field("Name")
            expect(page).to have_field("Address")
            expect(page).to have_button("Place Order")
          end
        end
    end
  end

  describe "new order page" do
    let!(:product) { FactoryGirl.create(:product) }
      before do
        visit store_index_path
        click_button 'Add to Cart'
        click_button "Checkout"
      end


    it { should have_content("Please Enter Your Details") }
    it { should have_field("Name") }
    it { should have_field("Address") }
    it { should have_button("Place Order") }

    describe "with invalid information" do
      before do
        fill_in "Name",       with: ""
        fill_in "Address",    with: "Lviv"
        fill_in "Email",      with: "mail@gmai.com"
        fill_in "Phone",      with: 550077
      end

      it "should not create a order" do
        expect { click_button "Place Order" }.not_to change(Order, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",       with: "Joe"
        fill_in "Address",    with: "Kyiv"
        fill_in "Email",      with: "mail@gmai.com"
        fill_in "Phone",      with: 550077
      end

      it "should create a order" do
        expect { click_button "Place Order" }.to change(Order, :count).by(1)
      end

      describe "after saving the order" do
        before { click_button "Place Order" }

        it { should have_content('Thank you for your order.') }
      end
    end
  end
end
