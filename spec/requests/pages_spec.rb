require 'rails_helper'

describe PagesController do
  describe "GET pages#show" do
    before do
      @page = create :page, uri: 'http://amazi.ng/post'
      6.times { create :like, page: @page }
    end

    it "returns the correct information" do
      get "/pages/#{@page.digest}"
      page_json = json['page']

      expect(page_json['uri']).to eq('http://amazi.ng/post')
      expect(page_json['likes_count']).to eq(6)
    end
  end
end
