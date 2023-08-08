class Student_list_DB < Basic_format
  require_relative 'Basic_format'
  require 'mysql2'
  require_relative 'DB_singleton'

  private
  def format_to_hash(str: )
    return  JSON.parse(str)
  end

  def hash_to_format(hash: )
    values = hash.map { |h|
      h.values.join ","
    }.map { |str|
      "(#{str})"
    }.join(",")
    return values
  end

  def read_file(rfile:)
    results = client.query("SELECT * FROM student", symbolize_keys: true)
    return JSON.pretty_generate(results)
  end

  def write_file(wfile:, data:)
    insert_query = "insert into student values #{data}"
    self.client.query insert_query
  end

  attr_accessor client = DB_singleton.instance.db_client

end