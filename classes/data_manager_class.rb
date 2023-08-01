require 'json'

class DataStorage
  def create_data_saver(filename, data)
    File.open(filename, 'w') do |file|
      json_data = JSON.generate(data)
      file.write(json_data)
    end
  end
end
