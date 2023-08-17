require "normal_decorator"

describe NormalDecorator do
  describe "#update" do
    subject { NormalDecorator.new(item) }
    let(:item) { Item.new("foo", 5, 6) }

    it "reduces sell_in by one" do
      subject.update
      expect(item.sell_in).to eq 4
    end

    context "when sell_in and quality don’t go below zero" do
      let(:item) { Item.new("Aged Brie", 1, 1) }

      it "reduces quality by one" do
        subject.update
        expect(item.quality).to eq 0
      end
    end

    context "when quality reaches zero" do
      let(:item) { Item.new("Aged Brie", 1, 0) }

      it "does not reduce quality any further" do
        subject.update
        expect(item.quality).to eq 0
      end
    end

    context "when sell_in goes below zero" do
      let(:item) { Item.new("Aged Brie", 0, 2) }

      it "reduces quality by two" do
        subject.update
        expect(item.quality).to eq 0
      end
    end

    context "when sell_in goes below zero and quality is already zero" do
      let(:item) { Item.new("Aged Brie", 0, 0) }

      it "does not reduce quality any further" do
        subject.update
        expect(item.quality).to eq 0
      end
    end
  end
end
