require 'bundler/setup'
require 'git'
require 'meetup_client'

# wysylanie zmian na serwer FTP: ftp_sync
# wysylanie zmian przy uzyciu SSH: 'net/scp'
# generowanie statycznego contentu: jekyll
# pobieranie zmian z meetupa: meetup_client

# odpalac przy pomocy nightli.es
task :test do
  g = Git.open('.')
  puts g.log.since('2 weeks ago')

  MeetupClient.configure do |config|
    config.api_key = '7829677c4328485c555d4b32d744b7b'
  end

  params = { category: '1',
      city: 'London',
      country: 'GB',
      status: 'upcoming',
      format: 'json',
      page: '50'}
    meetup_api = MeetupApi.new
    events = meetup_api.open_events(params)
  puts events
end
