require 'spec_helper'

describe Memo do
  before do
    @memo = Memo.new
  end

  it "should be valid" do
    @memo.should be_valid
  end
end
