require 'yaml'
require 'securerandom'

loop do

  file_path = "output.#{Time.now.strftime('%H-%M-%S_%Y-%m-%d')}.ymal"
  lesson = 'Lesson'
  lesson_id = 11
  platform = 'Otus'
  uuid = SecureRandom.uuid
  m1 = 'Module'
  m2 = SecureRandom.name
  m3 = 'UUID'

  data = {
    platform => {

      lesson => lesson_id,
      m3 => uuid,
      m1 => m2

    }

  }

  File.open("#{file_path}", 'w') do |file|
    YAML.dump(data, file)
  end

  system("cat #{file_path}")
  system("rm #{file_path}")
  sleep 10

rescue StandardError => e
  puts "ERROR: #{e.message}"
end
