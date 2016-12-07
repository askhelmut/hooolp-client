require "spec_helper"

describe Hoolp do
  let(:hoolp) do
    Hoolp.new(
      api_key: "testkey"
    )
  end

  describe "#event" do
    subject do
      VCR.use_cassette("events_for_location") do
        hoolp.events(location_id: "3852")
      end
    end

    context "when events are present for the given location" do
      it "returns an array" do
        expect(subject).to be_an Array
      end

      it "the returned array contains HoolpEvents" do
        subject.each do |item|
          expect(item).to be_a Hoolp::Resource::Event
        end
      end
    end
  end
end
