require "rails_helper"

RSpec.describe "static_pages/home.html.erb", type: :view do
  it "has tags" do
    render
    expect(rendered).to have_tag("div")
  end
end
