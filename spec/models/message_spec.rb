require 'rails_helper'

describe Message do
  context "validations" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:dialect_type) }
  end
end
