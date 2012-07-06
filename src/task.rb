require '../src/tag.rb'

class Task
  attr_reader :tag, :created_at, :completed_at, :description

  def initialize(description)
    @db = SQLite3::Database.new "./todo.db"
    @description = description
    @tag = []
    @created_at = Time.now
    @completed_at = nil

    @db.execute <<-SQL
            create table if not exists tasks (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              description VARCHAR NOT NULL,
              created_at DATETIME NOT NULL,
              completed_at DATETIME,
              FOREIGN KEY(list_id) REFERENCES lists(id)
            );
          SQL


  end

  def add_tag(name)
    @tag << Tag.new(name)
  end

  def remove_tag(description)
    @tag.each do |tag|
      if tag.name == description
        @tag.delete(tag)
      end
    end
  end

  def completed?
    if @completed_at == nil
      false
    else
      true
    end
  end

  def complete!
    @completed_at = Time.now
  end

  def to_s
    "#{@description} ; #{@created_at} ; #{@completed_at}"
  end

end
