require 'rails_helper'

describe PagesController do
  describe "GET pages#show" do
    context "when it exists" do
      before do
        @page = create :page, uri: 'http://amazi.ng/post'
        6.times { create :like, page: @page }
      end

      it "should return the correct information" do
        get "/pages/#{@page.digest}"
        page_json = json['page']

        expect(response).to be_success
        expect(page_json['uri']).to eq('http://amazi.ng/post')
        expect(page_json['likes_count']).to eq(6)
      end
    end

    context "when it does not exist" do
      it "should return a 404 error" do
        get "/pages/its-oa-trap"

        expect(response).to be_not_found
      end
    end
  end
end
