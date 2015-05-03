require 'rails_helper'

describe Page do
  subject { build :page }

  it { should be_valid }

  it { should validate_presence_of :uri }
  it { should validate_uniqueness_of :uri }

  describe "after saving" do
    it "should have the appropriate MD5 digest" do
      subject.uri = "https://bellonch.com"
      subject.save
      expect(subject.digest).to eq('97d9278ffa73e523f4f11d9439d7149b')
    end
  end
end
