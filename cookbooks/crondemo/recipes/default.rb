
  cron "log something" do
    action :create
    hour "*"
    minute "*"
    command "logger Hello!"
  end

