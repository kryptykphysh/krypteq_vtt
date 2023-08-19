require 'rails_helper'

RSpec.describe "scenes/show", type: :view do
  before(:each) do
    assign(:scene, Scene.create!(
      title: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
