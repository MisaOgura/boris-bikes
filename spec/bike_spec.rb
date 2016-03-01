require 'bike.rb'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  it { is_expected.to respond_to(:is_working)}
end
