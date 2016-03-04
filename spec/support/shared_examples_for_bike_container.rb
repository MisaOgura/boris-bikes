require 'bike'

shared_examples_for BikeContainer do

  let(:bike1) { double(:bike) }
  let(:bike2) { double(:bike) }
    # need to remember that the return value doesn't *always* effect
    # the outcome of the called method - ie return_bikes
  let(:source) { double(:BikeContainer, remove_bikes: [], bikes: [bike1, bike2] ) }

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  it 'display loaded bikes' do
    subject.bikes << bike1
    subject.bikes << bike2
    expect(subject.bikes).to eq [bike1, bike2]
  end

  describe "#capacity" do
    it "can set a capacity when given a value" do
      container = BikeContainerTest.new(40)
      expect(container.capacity).to eq 40
    end
  end

  describe "#load_bikes" do
    it 'responds to load bikes' do
        expect(subject).to respond_to(:load_bikes).with(1).argument
    end

    it 'loads bikes from source' do
      subject.load_bikes(source)
      expect(subject.bikes).to eq [bike1, bike2]
    end

    it 'removes bikes from source' do
      subject.load_bikes(source)
      expect(source).to respond_to(:remove_bikes).with(1).argument
    end
  end

  describe '#remove_bikes' do
    it 'responds to remove bikes' do
      expect(subject).to respond_to(:remove_bikes).with(1).argument
    end

    it 'removes all bikes by default' do
      subject.load_bikes(source)
      expect(subject.remove_bikes(subject.bikes)).to eq []
    end

    it 'removes selected bikes only' do
      subject.load_bikes(source)
      expect(subject.remove_bikes([bike1])).to eq [bike2]
    end
  end
end
