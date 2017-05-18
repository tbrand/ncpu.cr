require "./spec_helper"

describe Ncpu do

  it "lower_bound" do
    (Ncpu.get() >= 0).should be_true
  end
end
