require 'rails_helper'


describe ApplicationHelper, type: :helper do
  let(:selected) { [] }
  let(:options) { "<option value=\"yoda\">Yoda</option>\n<option value=\"valspeak\">Valley Girl</option>\n<option value=\"pirate\">Pirate</option>" }

  describe "#dialect_select_options" do
    it "Returns options in correct format for html" do
      expect(helper.dialect_select_options(selected)).to eq(options)
    end
  end
end
