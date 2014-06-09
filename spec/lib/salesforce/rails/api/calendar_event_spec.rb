require 'spec_helper'

describe Salesforce::Rails::API::CalendarEvent do
  class TestClass < Salesforce::Rails::API::CalendarEvent
  end

  before do
    config = YAML.load_file(File.join(::Rails.root, 'fixtures/salesforce.yml'))
    config = config.has_key?(::Rails.env) ? config[::Rails.env] : config
    token = config["token"]
    instance_url = config["instance_url"]
    @client = Databasedotcom::Client.new(config)
    @client.authenticate(:token => token, :instance_url => instance_url)
    TestClass.client = @client
  end

  context ".all" do
    it "returns all records of events as instances" do
      @client.should_receive(:query).with("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event").and_return("foo")
      TestClass.all.should == "foo"
    end
  end

  context ".query" do
    it "constructs and submits a SOQL query" do
      @client.should_receive(:query).with("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event WHERE Subject = 'foo'").and_return("bar")
      TestClass.query("Subject = 'foo'").should == "bar"
    end
  end
end