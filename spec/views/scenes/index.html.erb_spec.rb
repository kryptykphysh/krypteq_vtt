require 'rails_helper'

RSpec.describe "scenes/index", type: :view do
  before(:each) do
    assign(:scenes, [
      Scene.create!(
        title: ""
      ),
      Scene.create!(
        title: ""
      )
    ])
  end

  it "renders a list of scenes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
