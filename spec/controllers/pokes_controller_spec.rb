require 'spec_helper'

describe PokesController do
  describe "POST create" do
    context "when there is an user with the same email" do
      before { @user = Fabricate(:user) }

      it "should create a poke for this user" do
        expect {
          post(:create, first_name: @user.first_name, last_name: @user.last_name, email: @user.email)
        }.to change{@user.pokes.count}.by(1)
      end

      context "when the user already poked" do
        before { @poke = Fabricate(:poke, user: @user) }

        it "should not create a poke for this user" do
          expect {
            post(:create, first_name: @user.first_name, last_name: @user.last_name, email: @user.email)
          }.to_not change{@user.pokes.count}
        end
      end
    end

    context "when there is no user with the same email" do
      it "should create a new user" do
        expect {
          post(:create, first_name: "Nícolas", last_name: "Iensen", email: "nicolas@test.com")
        }.to change{User.count}.by(1)
      end

      it "should create a new poke" do
        expect {
          post(:create, first_name: "Nícolas", last_name: "Iensen", email: "nicolas@test.com")
        }.to change{Poke.count}.by(1)
      end
    end
  end
end
