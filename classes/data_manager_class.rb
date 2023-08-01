require 'json'

class DataStorage
  def create_data_saver(file, data)
    File.open(file, 'w') do |file|
      json_data = JSON.generate(data)
      file.write(json_data)
  end
end