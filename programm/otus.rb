require 'yaml'
require 'securerandom'

PLATFORM = 'Otus'
LESSON_NAME = 'Lesson'
MODULE_NAME = 'Module'

Signal.trap('INT') { puts "\nStopping..."; exit }

loop do
  begin
    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    file_name = "otus_lesson_#{timestamp}.yml"

    data = {
      PLATFORM => {
        LESSON_NAME => 11,
        'UUID' => SecureRandom.uuid,
        MODULE_NAME => SecureRandom.name
      }
    }

    File.write(file_name, YAML.dump(data))
    puts "Created: #{file_name}"

    sleep 10
  rescue StandardError => e
    puts "Error: #{e.message}"
    sleep 5
    retry
  end
end
