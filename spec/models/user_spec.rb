require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it{expect validate_presence_of :name}
    it{expect validate_presence_of :email}
    it{expect validate_presence_of :password}
  end
  context "association" do
    it{expect have_many :posts}
    it{expect have_many :comments}
    it{expect have_many :followers}
    it{expect have_many :following}
    it{expect have_many :active_relationships}
    it{expect have_many :passive_relationships}
  end
end
