require 'rails_helper'

describe LikesController do
  describe "POST likes#create" do
    context "when the page exists" do
      before do
        @page = create :page
        6.times { create :like, page: @page }
      end

      context "with a still-non-existing identity" do
        it "should return success and increase the number of likes" do
          mock_request_ip('1.2.3.4')
          post "/pages/#{@page.digest}/likes"

          expect(response).to be_success
          expect(@page.likes.count).to eq(7)
          @identity = Identity.find_by(ip: '1.2.3.4')
          expect(@identity.likes.count).to eq(1)
        end
      end

      context "with an existing identity" do
        before { @identity = create :identity, ip: '1.2.3.4' }

        context "and the identity has not liked it yet" do
          it "should return success and increase the number of likes" do
            mock_request_ip('1.2.3.4')
            post "/pages/#{@page.digest}/likes"

            expect(response).to be_success
            expect(@page.likes.count).to eq(7)
            expect(@identity.likes.count).to eq(1)
          end
        end

        context "and the identity has already liked it" do
          before do
            create :like, page: @page, identity: @identity
          end

          it "should be forbidden and keep the number of likes" do
            mock_request_ip('1.2.3.4')
            post "/pages/#{@page.digest}/likes"

            expect(response).to be_forbidden
            expect(@page.likes.count).to eq(7)
            expect(@identity.likes.count).to eq(1)
          end
        end
      end
    end

    context "when it does not exist" do
      it "should return a 404 error" do
        post "/pages/non-existing/likes"

        expect(response).to be_not_found
      end
    end
  end
end
