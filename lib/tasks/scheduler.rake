desc "This task is called by the Heroku scheduler add-on"
task :markov_submit=> :environment do
  ApiConnector.new.submit_poem
end

