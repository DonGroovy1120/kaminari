require 'spec_helper'
require 'mongoid'
require 'kaminari/models/mongoid_extension'

describe Kaminari::MongoidExtension do

  before do
    begin
      Mongoid.configure do |config|
        config.master = Mongo::Connection.new.db("kaminari_test")
      end
      class MongoidExtension_Developer
        include ::Mongoid::Document
        field :salary, type: Integer
      end
    rescue Mongo::ConnectionFailure
      pending 'can not connect to MongoDB'
    end
  end

  before(:each) do
    MongoidExtension_Developer.all.destroy
    41.times do
      MongoidExtension_Developer.create!({:salary => 1})
    end
  end

  describe '#page' do
    
    context 'page 1' do
      subject { MongoidExtension_Developer.page 1 }
      it { should be_a Mongoid::Criteria }
      its(:current_page) { should == 1 }
      its(:limit_value) { should == 25 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 25 }
      it { should skip(0) }
    end

    context 'page 2' do
      subject { MongoidExtension_Developer.page 2 }
      it { should be_a Mongoid::Criteria }
      its(:current_page) { should == 2 }
      its(:limit_value) { should == 25 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 16 }
      it { should skip 25 }
    end

    context 'page "foobar"' do
      subject { MongoidExtension_Developer.page 'foobar' }
      it { should be_a Mongoid::Criteria }
      its(:current_page) { should == 1 }
      its(:limit_value) { should == 25 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 25 }
      it { should skip 0 }
    end

    context 'with criteria before' do
      subject { MongoidExtension_Developer.where(:salary => 1).page 2 }
      its(:selector) { should == {:salary => 1} }
      its(:current_page) { should == 2 }
      its(:limit_value) { should == 25 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 16 }
      it { should skip 25 }
    end

    context 'with criteria after' do
      subject { MongoidExtension_Developer.page(2).where(:salary => 1) }
      its(:selector) { should == {:salary => 1} }
      its(:current_page) { should == 2 }
      its(:limit_value) { should == 25 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 16 }
      it { should skip 25 }
    end
  end

  describe '#per' do
    subject { MongoidExtension_Developer.page(2).per(10) }
    it { should be_a Mongoid::Criteria }
    its(:current_page) { should == 2 }
    its(:limit_value) { should == 10 }
    its(:num_pages) { should == 5 }
    its(:current_page_count) { should == 10 }
    it { should skip 10 }
  end

  describe '#page in embedded documents' do
    before :all do
      class MongoMongoidExtension_Developer
        include ::Mongoid::Document
        field :salary, :type => Integer
        embeds_many :frameworks
      end

      class Framework
        include ::Mongoid::Document
        field :name, :type => String
        field :language, :type => String
        embedded_in :mongo_MongoidExtension_Developer
      end
    end

    before :all do
      @developer = MongoMongoidExtension_Developer.new
      @developer.frameworks.new(:name => "rails", :language => "ruby")
      @developer.frameworks.new(:name => "merb", :language => "ruby")
      @developer.frameworks.new(:name => "sinatra", :language => "ruby")
      @developer.frameworks.new(:name => "cakephp", :language => "php")
      @developer.frameworks.new(:name => "tornado", :language => "python")
    end

    context 'page 1' do
      subject { @developer.frameworks.page(1).per(1) }
      it { should be_a Mongoid::Criteria }
      its(:total_count) { should == 5 }
      its(:limit_value) { should == 1 }
      its(:current_page) { should == 1 }
      its(:num_pages) { should == 5 }
      its(:current_page_count) { should == 1 }
    end

    context 'with criteria after' do
      subject { @developer.frameworks.page(1).per(2).where(:language => "ruby") }
      it { should be_a Mongoid::Criteria }
      its(:total_count) { should == 3 }
      its(:limit_value) { should == 2 }
      its(:current_page) { should == 1 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 2 }
    end

    context 'with criteria before' do
      subject { @developer.frameworks.where(:language => "ruby").page(1).per(2) }
      it { should be_a Mongoid::Criteria }
      its(:total_count) { should == 3 }
      its(:limit_value) { should == 2 }
      its(:current_page) { should == 1 }
      its(:num_pages) { should == 2 }
      its(:current_page_count) { should == 2 }
    end
  end
end
