require "spec_helper"

describe NPR::Entity::Story do
  describe "::find" do
    before :all do
      NPR.config.apiKey = "key"
    end
        
    after :all do
      NPR.config.apiKey = nil
    end
    
    it "instantiates a new story" do
      story = mock_response "json/01_story_full_media.json" do
        NPR::Entity::Story.find(167019577)
      end
      
      story.should be_a NPR::Entity::Story
    end
    
    it "typecasts the attributes that need it" do
      story = mock_response "json/01_story_full_media.json" do
        NPR::Entity::Story.find(167019577)
      end
      
      story.id.should be_a Fixnum
      story.pubDate.should be_a Time
    end
  end
  
  #--------------------
  
  describe "::where" do
    it "creates a new QueryBuilder object and runs where on it" do
      args = { :id => 9999 }
      query = NPR::Entity::Story.where(args)
      query._klass.should eq NPR::Entity::Story
      query.builder[:conditions].should eq args
    end
  end
  
  #--------------------
  
  describe "::order" do
    it "creates a new QueryBuilder object and runs where on it" do
      args = "date descending"
      query = NPR::Entity::Story.order(args)
      query.builder[:order].should eq args
    end
  end
  
  #--------------------
  
  describe "::limit" do
    it "creates a new QueryBuilder object and runs where on it" do
      args = 10
      query = NPR::Entity::Story.limit(args)
      query.builder[:limit].should eq args
    end
  end
  
  #--------------------
  
  describe "::offset" do
    it "creates a new QueryBuilder object and runs where on it" do
      args = 100
      query = NPR::Entity::Story.offset(args)
      query.builder[:offset].should eq args
    end
  end  
end