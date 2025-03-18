require 'yaml'
require 'securerandom'

PLATFORM = 'Otus'
LESSON_NAME = 'Lesson'
MODULE_NAME = 'Module'

Signal.trap('INT') { puts "\nStopping..."; exit }

loop do
  begin

    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')

    data = {
      PLATFORM => {
        LESSON_NAME => 11,
        'UUID' => SecureRandom.uuid,
        MODULE_NAME => SecureRandom.name
      }
    }

    message = YAML.dump(data)



    puts(message)
    system("echo -e \"#{message}\" | mail -s \"OTUS_SERVICE\" root ")
    sleep 30
  rescue StandardError => e
    puts "Error: #{e.message}"
    sleep 5
    retry
  end
end
