require "rails_helper"

RSpec.describe "static_pages/index.html.erb", type: :view do
  it "has tags" do
    render
    expect(rendered).to have_tag("h2")
    expect(rendered).to have_tag("div")
  end
end
