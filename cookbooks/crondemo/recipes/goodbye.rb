
  cron "log something else" do
    action :create
    hour "*"
    minute "*"
    command "logger Goodbye!"
  end      

