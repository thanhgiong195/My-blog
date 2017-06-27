require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "validations" do
    it{expect validate_presence_of :follower}
    it{expect validate_presence_of :followed}
  end
end
