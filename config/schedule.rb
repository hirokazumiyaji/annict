set :output, "/home/annict/shared/log/cron_log.log"

every 1.day, at: "19:30 pm" do
  rake "session:sweep"
end

every 1.day, at: "11:00 am" do
  rake "work:notify_untouched_works"
end

every 1.hour, at: "11:00 am" do
  rake "syobocal:save"
end
