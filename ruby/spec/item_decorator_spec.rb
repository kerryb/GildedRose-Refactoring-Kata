require_relative "../lib/gilded_rose"

describe ItemDecorator do
  describe "#update" do
    subject { ItemDecorator.new(item) }
    let(:item) { Item.new("foo", 5, 6) }

    it "does not change sell_in" do
      subject.update
      expect(item.sell_in).to eq 5
    end

    it "does not change quality" do
      subject.update
      expect(item.quality).to eq 6
    end
  end
end
