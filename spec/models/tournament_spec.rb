require "spec_helper"

describe Tournament do
  it "requires name" do
    Tournament.new.should have(1).error_on(:name)
  end
end

