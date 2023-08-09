class Basic_format
  protected
  def format_to_hash(str)

  end

  def hash_to_format(hash)

  end
end

def read_file(rfile: )
  file = File.open(rfile, "r")
  return file.read
end

def write_file(wfile: , data:)
  file_text = File.open(wfile, "w")
  file_text.write(data)
  file_text.close
end

public
def file_data_to_hash(rfile:)
  return format_to_hash(str: read_file(rfile: rfile))
end

def hash_to_file(wfile: , hash:)
  write_file(wfile:wfile, data: hash_to_format(hash:hash))
  return nil
end