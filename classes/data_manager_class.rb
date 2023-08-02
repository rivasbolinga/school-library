require 'json'

class DataStorage
  def load_data(filename)
    return unless File.exist?(filename)

    json_data = File.read(filename)
    JSON.parse(json_data)
  end

  def create_data_saver(filename, data)
    existing_data = load_data(filename) || []
    updated_data = existing_data + data
    File.open(filename, 'w') do |file|
      json_data = JSON.generate(updated_data)
      file.write(json_data)
    end
  end
end
