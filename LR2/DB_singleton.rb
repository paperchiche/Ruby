require "mysql2"

class DB_singleton
  private_class_method :new

  attr_accessor :db_client
  private :"db_client="

  def initialize
    self.db_client = Mysql2::Client.new(host: "localhost",
                                        username: "root",
                                        database: "students")
  end

  @instance = new

  def self.instance
    @instance
  end
end