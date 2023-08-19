require 'rails_helper'

RSpec.describe "scenes/edit", type: :view do
  let(:scene) {
    Scene.create!(
      title: ""
    )
  }

  before(:each) do
    assign(:scene, scene)
  end

  it "renders the edit scene form" do
    render

    assert_select "form[action=?][method=?]", scene_path(scene), "post" do

      assert_select "input[name=?]", "scene[title]"
    end
  end
end
