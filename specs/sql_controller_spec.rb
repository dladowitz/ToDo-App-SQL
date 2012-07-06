require "sqlite3"
require "../src/sql_controller.rb"




describe "SQL _ Controller!!!!" do

    it "should create a database" do
      db = SQLController::create_db('test3.db')
      db.class.should eq (SQLite3::Database)
    end

end