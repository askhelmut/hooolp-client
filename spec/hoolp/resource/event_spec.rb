require "spec_helper"

describe Hoolp::Resource::Event do
  let(:event_file) { "#{File.expand_path File.dirname(__FILE__)}/../../fixtures/event.json" }
  let(:event) { JSON.parse(File.read(event_file)) }

  subject { described_class.new(event) }

  describe "#id" do
    it { expect(subject.id).to eq("5108274") }
  end

  describe "#starts_at" do
    it { expect(subject.starts_at).to eq(Time.parse("2016-12-08 20:00:00").utc) }
  end

  describe "#title" do
    it { expect(subject.title).to eq("Bukahara") }
  end

  describe "#description" do
    it { expect(subject.description).to eq("This is a description.") }
  end

  describe "#image_url" do
    it { expect(subject.image_urls).to eq(["http://hooolp.com/media/avatars/bands/1374261756_www-hooolp-com_5757970"]) }
  end

  describe "#genres" do
    it { expect(subject.genres).to eq(%w(Gothic Electro)) }
  end
end
