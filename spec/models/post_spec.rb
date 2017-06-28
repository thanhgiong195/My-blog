require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it{expect validate_presence_of :user}
    it{expect validate_presence_of :title}
    it do
      expect validate_length_of(:title)
      .is_at_most Settings.post.title_size
    end
    it{expect validate_presence_of :content}
    it do
      expect validate_length_of(:content)
      .is_at_most Settings.post.content_size
    end
  end

  context "associations" do
    it{is_expected.to belong_to :user}
    it{expect have_many :comments}
    it{expect have_many :tags}
    it{expect have_many :post_tags}
  end
end
