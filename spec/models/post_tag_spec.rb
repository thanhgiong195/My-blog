require 'rails_helper'

RSpec.describe PostTag, type: :model do
  context "associations" do
    it{is_expected.to belong_to :post}
    it{is_expected.to belong_to :tag}
  end

  describe "validations" do
    it{expect validate_presence_of :tag}
    it{expect validate_presence_of :post}
  end
end
