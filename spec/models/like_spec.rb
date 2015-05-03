require 'rails_helper'

describe Like do
  subject { build :like }

  it { should be_valid }

  it { should validate_presence_of :identity }
  it { should validate_presence_of :page }
end
