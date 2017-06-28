require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "validations" do
    it{expect validate_presence_of :name}
    it do
      expect validate_length_of(:name)
      .is_at_most Settings.tag.tag_max
    end
  end

  context "association" do
    it{expect have_many :posts}
    it{expect have_many :post_tags}
  end
end
