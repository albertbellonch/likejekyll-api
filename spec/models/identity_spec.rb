require 'rails_helper'

describe Identity do
  subject { build :identity }

  it { should be_valid }

  it { should validate_presence_of :ip }
  it { should validate_uniqueness_of :ip }

  describe "#like!" do
    before do
      subject.save
      @page = create :page
    end

    context "when the identity has not liked the page yet" do
      it "should return true and create the like" do
        expect(subject.like!(@page)).to eq(true)
        expect(subject.likes.where(page: @page).count).to eq(1)
      end
    end

    context "when the identity has already liked the page" do
      before { create :like, identity: subject, page: @page }

      it "should return false and only keep one like" do
        expect(subject.like!(@page)).to eq(false)
        expect(subject.likes.where(page: @page).count).to eq(1)
      end
    end
  end
end
