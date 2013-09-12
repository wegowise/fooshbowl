require "spec_helper"

describe Season do
  it { should have_many(:games) }
end

