require 'van'

shared_examples_for "checking bikes in storage" do
  # let(:storage1) { [1, 2, 3, 4, 5] }

  describe "check bikes" do
    it "displays all bikes" do
      storage
    end
  end

  # it "transfers bikes from storage1 to van"
  #
  # it "clears bikes from storage1"
  #
  # it "van contains bikes"
end

  describe Van do
    it_should_behave_like "checking bikes in storage" do
      let(:storage) { [1,2,3,4,5] }
    end
  end
