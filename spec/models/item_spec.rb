require "rails_helper"

RSpec.describe Item, type: :model do
  let(:item) do
    Item.new(name:        "SONY TV",
             description: "43 inch Sony Smart TV with some cool feature like ambient mode smart remote and lot more",
             price:       35000,
             quantity:    500)
  end
  describe "#validations" do
    context "when all the attributes are valid" do
      it "then it is valid" do
        expect(item).to be_valid
      end
    end

    context "when item name is nil" do
      it "then it is not valid" do
        item.name = nil
        expect(item).not_to be_valid
      end
    end

    context "when item name has length more than 30" do
      it "then it is not valid" do
        item.name = "ONEPLUS WIRLESS 12.4 MM DRIVER SIZE IPX5 EARBUDS"
        expect(item).not_to be_valid
      end
    end

    context "when item price is less than or equal to 0" do
      it "then it is not valid" do
        item.price = -1
        expect(item).not_to be_valid
      end
    end

    context "when item quantity is less than or equal to 0" do
      it "then it is not valid" do
        item.quantity = -1
        expect(item).not_to be_valid
      end
    end

    context "when item description has length more than 300" do
      it "then it is not valid" do
        item.description = "-" * 301
        expect(item).not_to be_valid
      end
    end
  end
end
