require 'rails_helper'

describe PagesController do
  describe "GET pages#show" do
    context "when it exists" do
      before do
        @page = create :page, uri: 'http://amazi.ng/post'
        @identity = create :identity, ip: '1.2.3.4'
        6.times { create :like, page: @page }
      end

      context "and is liked by the identity" do
        before { create :like, page: @page, identity: @identity }

        it "should return the correct information" do
          mock_request_ip('1.2.3.4')
          get "/pages/#{@page.digest}"
          page_json = json['page']

          expect(response).to be_success
          expect(page_json['uri']).to eq('http://amazi.ng/post')
          expect(page_json['likes_count']).to eq(7)
          expect(page_json['liked']).to eq(true)
        end
      end

      context "and is not liked by the identity" do
        it "should return the correct information" do
          mock_request_ip('1.2.3.4')
          get "/pages/#{@page.digest}"
          page_json = json['page']

          expect(response).to be_success
          expect(page_json['uri']).to eq('http://amazi.ng/post')
          expect(page_json['likes_count']).to eq(6)
          expect(page_json['liked']).to eq(false)
        end
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
