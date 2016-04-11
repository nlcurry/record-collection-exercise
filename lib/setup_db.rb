require 'sqlite3'

class ReleaseDatabase
	attr_reader :db

	def initialize(dbname="releases")
		@db = SQLite3::Database.new "database/#{dbname}.db"
	end
  
  def reset_schema!
    query = <<-CREATESTATEMENT
      CREATE TABLE albums (
      id INTEGER PRIMARY KEY,
      label_code BLOB,
      artist TEXT NOT NULL,
      title TEXT NOT NULL,
      label TEXT,
      format TEXT,
      released INTEGER,
      date_added TEXT
      );
    CREATESTATEMENT

    @db.execute("DROP TABLE IF EXISTS albums;")
    @db.execute(query)
  # table name: albums
  # label_code,artist,title,label,format,released,date_added
  # BLOB, TEXT, TEXT, TEXT, TEXT,         INTEGER,      TEXT
  # one table
	end
end
release_db = ReleaseDatabase.new
release_db.reset_schema!
