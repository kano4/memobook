require 'spec_helper'

describe "memos/index.html.haml" do
  before(:each) do
    assign(:memos, [
      stub_model(Memo, :body => "Body"),
      stub_model(Memo, :body => "Body")
    ])
    assign(:new_memo, [
      stub_model(Memo, :body => "Body")
    ])
  end

  it "should have h1" do
    render.should have_selector('h1', text: 'Listing memos')
  end

  it "should have a list of memos" do
    render.should have_selector('div#memos div.memo', count: 2)
  end
end
