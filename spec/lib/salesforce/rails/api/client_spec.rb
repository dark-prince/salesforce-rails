require 'spec_helper'

describe Salesforce::Rails::API::Client do
  class TestClass
    include Salesforce::Rails::API::Client
  end

  context ".client" do
    after(:each) do
      TestClass.client = nil
    end

    describe "if the config has an entry that matches Rails.env" do
      before(:each) do
        config_hash = {
          :development => { "client_id" => "development_client_id", "client_secret" => "development_client_secret", "username" => "development_user", "password" => "development_password" },
          :test => { "client_id" => "test_client_id", "client_secret" => "test_client_secret", "username" => "test_user", "password" => "test_password" },
          :production => { "client_id" => "production_client_id", "client_secret" => "production_client_secret", "username" => "production_user", "password" => "production_password" }
        }

        YAML.should_receive(:load_file).and_return(config_hash)
        ::Rails.stub(:env).and_return(:production)
      end
      
      it "should use the related entry" do
        Databasedotcom::Client.any_instance.should_receive(:authenticate).with(:username => "production_user", :password => "production_password")
        TestClass.client
      end
    end

    describe "if the config does not have an entry that matches Rails.env" do
      it "should use the top level config" do
        conf_hash = { "client_id" => "client_id", "client_secret" => "client_secret", "username" => "production_user", "password" => "production_password" }
        ::Rails.stub(:env).and_return(:production)
        YAML.should_receive(:load_file).and_return(conf_hash)
        Databasedotcom::Client.any_instance.should_receive(:authenticate).with(:username => "production_user", :password => "production_password")
        TestClass.client
      end
    end
    
    describe "test_user" do
      before(:each) do
        config_hash = { "client_id" => "client_id", "client_secret" => "client_secret", "username" => "test_user", "password" => "test_password" }
        YAML.should_receive(:load_file).and_return(config_hash)
        ::Rails.stub(:env).and_return(:test)
      end
    
      it "constructs and authenticates a Databasedotcom::Client" do
        Databasedotcom::Client.any_instance.should_receive(:authenticate).with(:username => "test_user", :password => "test_password")
        TestClass.client
      end
    
      it "is memoized" do
        Databasedotcom::Client.any_instance.should_receive(:authenticate).exactly(1).times.with(:username => "test_user", :password => "test_password")
        TestClass.client
        TestClass.client
      end
    end
  end
end