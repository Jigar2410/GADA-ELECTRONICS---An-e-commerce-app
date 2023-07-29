require "rails_helper"

RSpec.describe "Item", type: :request do
  before(:all) do
    User.create(username: "mjigar", email: "mjigar848@gmail.com", password: "jigar@123")
    post "/", params: { email: "mjigar848@gmail.com", password: "jigar@123" }
  end
  let(:valid_attributes) do
    { name: "SONY TV", description: "43 inch LED", price: 50_000, quantity: 20 }
  end
  let(:invalid_attributes) { { name: nil } }

  context "when all attributes are invalid" do
    it "raise validation error" do
      expect { Item.create! invalid_attributes }.to raise_error(ActiveRecord::RecordInvalid,
                                                                "Validation failed: Name can't be blank, Price can't be blank, Quantity can't be blank")
    end
  end

  describe "GET /items" do
    context "when all attributes are valid" do
      it "renders a successful response" do
        Item.create! valid_attributes
        get items_path
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      item = Item.create! valid_attributes
      get item_path(item)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_item_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      item = Item.create! valid_attributes
      get edit_item_path(item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "when all attributes are valid" do
      it "creates a new item" do
        expect { post items_path, params: { item: valid_attributes } }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post items_path, params: { item: valid_attributes }
        expect(response).to redirect_to(item_path(Item.last))
      end

      it "flash the success message" do
        post items_path, params: { item: valid_attributes }
        expect(flash[:success]).to eq("Item was successfully added")
      end
    end

    context "when attributes are invalid" do
      it "does not create a new item" do
        expect { post items_path, params: { item: invalid_attributes } }.to change(Item, :count).by(0)
      end
    end
  end
end
