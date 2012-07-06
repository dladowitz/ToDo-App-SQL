require "sqlite3"

module SQLController


  def self.create_db(filename)
    @db = SQLite3::Database.new(filename)
  end

end

# my_class = SQL_controller.new('test2.db')