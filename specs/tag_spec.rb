require '../src/tag.rb'

describe "Tag" do
  before (:each) do
    @my_tag = Tag.new("Chores")
  end

  it "creates an instance of Tags" do
    @my_tag.should be_an_instance_of Tag
  end

  it "takes a name attribute" do
    @my_tag.name.should eq('Chores')
  end

end