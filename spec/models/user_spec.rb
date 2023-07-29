require "rails_helper"

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) do
    User.new(username: "mjigar",
             email:    "mjigar848@gmail.com",
             password: "jigar@123")
  end
  describe "#validations" do
    context "when all the attributes are valid" do
      it "then it is valid" do
        expect(user).to be_valid
      end
    end

    context "when username is not valid" do
      context "because of its absence" do
        it "then it is not valid" do
          user.username = nil
          expect(user).not_to be_valid
        end
      end

      context "because of its length criteria" do
        it "then it is not valid" do
          user.username = "A"
          expect(user).not_to be_valid
        end
      end

      context "because of its duplicacy" do
        it "then it is not valid" do
          User.create(username: "mjigar", email: "jolly123@gmail.com", password: "jolly@123")
          binding.pry
          expect(user).not_to be_valid
        end
      end
    end

    context "when email is not valid" do
      context "because of its absence" do
        it "then it is not valid" do
          user.email = nil
          expect(user).not_to be_valid
        end
      end

      context "because of its invalid format" do
        it "then it is not valid" do
          user.email = "jolly1234"
          expect(user).not_to be_valid
        end
      end

      context "because of its duplicacy" do
        it "then it is not valid" do
          User.create(username: "jolly123", email: "mjigar848@gmail.com", password: "jolly@123")
          expect(user).not_to be_valid
        end
      end
    end

    context "when password is not valid" do
      it "then it is not valid" do
        user.password = nil
        expect(user).not_to be_valid
      end
    end
  end
end
