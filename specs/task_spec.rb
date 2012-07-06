require "../src/task.rb"
require "../src/tag.rb"

describe "Task" do

  before(:each) do
    @my_task = Task.new("Walk the dog")
  end

  describe "On Initialization" do

    it "should initialize" do
      @my_task.should be_an_instance_of Task
    end

    it "should initilize with a description" do
      @my_task.description.should eq('Walk the dog')

    end

    it "should initialize with a creation date" do
      @my_task.created_at.should_not be nil
    end

    it "should initialize with a completed date of nil" do
      @my_task.completed_at.should be nil
    end

  end

  describe "Adding/Removing Tags" do

    it "should be able to add a tag" do
      @my_task.add_tag("Chore")
      @my_task.tag[0].name.should include "Chore"
    end

    it "should add a tag object" do
      @my_task.add_tag("Chore")
      @my_task.tag[0].should be_an_instance_of Tag
    end

    it "should be able to remove a tag" do
      @my_task.tag[0].should be nil
      @my_task.add_tag("Chore")
      @my_task.tag[0].should be_an_instance_of Tag
      @my_task.remove_tag("Chore")
      @my_task.tag[0].should be nil
    end

  end

  describe "Completing and Checking if Complete" do

     it "should not be complete on initilization" do
        @my_task.completed?.should be false
      end

    it "should be able to complete a task" do
         @my_task.completed?.should be false
         @my_task.complete!
         @my_task.completed?.should be true
       end
  end

  describe "writing to strings" do

    it "should be able to convert an attribute to a string" do
        @my_task.to_s.should eq("#{@my_task.description} ; #{@my_task.created_at} ; #{@my_task.completed_at}")
    end

  end

end