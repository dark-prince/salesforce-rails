require 'spec_helper'

RSpec.describe Salesforce::Rails::API::CalendarEvent do
  class TestClass < Salesforce::Rails::API::CalendarEvent
  end

  before do
    config = YAML.load(ERB.new(File.new(File.join(::Rails.root, 'config', 'salesforce.yml')).read).result)
    config = config.has_key?(::Rails.env) ? config[::Rails.env] : config
    token = config["token"]
    instance_url = config["instance_url"]
    @client = Databasedotcom::Client.new(config)
    @client.authenticate(:token => token, :instance_url => instance_url)
    TestClass.client = @client
  end

  context ".all" do
    it "returns all records of events as instances" do
      expect(@client).to receive(:query).with("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event").and_return("foo")
      expect(TestClass.all).to eq("foo")
    end
  end

  context ".query" do
    it "constructs and submits a SOQL query" do
      expect(@client).to receive(:query).with("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event WHERE Subject = 'foo'").and_return("bar")
      expect(TestClass.query("Subject = 'foo'")).to eq("bar")
    end
  end
end