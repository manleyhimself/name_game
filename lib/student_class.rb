require 'sqlite3'
require 'pry'

class Student
  attr_accessor :name, :image, :id


  if File.exists?('students.db')
    File.delete('students.db')
  end
  @@db = SQLite3::Database.new "students.db"
  @@db.execute %Q{
    CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      image TEXT)
  }

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = ?"
    result = @@db.execute(sql, id)
    Student.new_from_db(result.first)
  end

  def self.all
    sql = "SELECT * FROM students"
    result = @@db.execute(sql)
    result.map do |row|
      Student.new_from_db(row)
    end
  end

  def self.new_from_db(row)
    s = Student.new
    s.id = row[0]
    s.name = row[1]
    s.image = row[2]
    s.saved!
    s
  end

  def saved!
    @saved = true
  end

  def saved?
    @saved
  end

  def insert
    sql = "INSERT INTO students (name, image) VALUES (?,?)"
    result = @@db.execute(sql, self.name, self.image)
    saved!
    sql = "SELECT id FROM students WHERE name = ? ORDER BY id DESC LIMIT 1"
    result = @@db.execute(sql, self.name)
    self.id = result.flatten.first
  end

  def save
    saved? ? update : insert
  end

  def update
    if saved?
      sql = "UPDATE students SET name = ?, image = ? WHERE id = ?"
      result = @@db.execute(sql, self.name, self.image, self.id)
    end
  end

  def url
    self.name.gsub(" ","-")
  end

end
