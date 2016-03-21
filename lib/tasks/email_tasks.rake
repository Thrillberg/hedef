desc 'send report request emails'
task :send_report_request_emails => :environment do
  teams = []
  Team.all.each do |team|
    teams << team
  end
  ApplicationMailer.send_report_request_emails(teams).deliver!
end
