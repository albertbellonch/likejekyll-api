require 'rails_helper'

describe TestController, type: :controller do
  describe "GET check" do
    it "returns correct types" do
      get :check
      expect_json({ status: "ok" })
    end
  end
end
