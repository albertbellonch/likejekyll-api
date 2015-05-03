require 'rails_helper'

describe Identity do
  subject { build :identity }

  it { should be_valid }

  it { should validate_presence_of :ip }
  it { should validate_uniqueness_of :ip }
end
