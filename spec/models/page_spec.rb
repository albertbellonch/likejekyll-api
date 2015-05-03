require 'rails_helper'

describe Page do
  subject { build :page }

  it { should be_valid }

  it { should validate_presence_of :uri }
  it { should validate_uniqueness_of :uri }
end
