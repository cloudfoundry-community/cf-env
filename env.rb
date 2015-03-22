require 'rubygems'
require 'sinatra'
require 'json/pure'

get '/' do
  puts "Current env keys: #{ENV.keys.sort.inspect}"
  res = "<html><body style=\"margin:0px auto; width:80%; font-family:monospace\">"
  res << "<head>"
  res << "<meta name=\"robots\" content=\"noindex, nofollow\">"
  res << "<meta name=\"viewport\" content=\"width=device-width\">"
  res << "<title>Cloud Foundry Environment</title>"
  res << "</head>"
  res << "<h2>Cloud Foundry Environment</h2>"
  res << "<div><table>"
  ENV.keys.sort.each do |key|
    value = begin
                "<pre>" + JSON.pretty_generate(JSON.parse(ENV[key])) + "</pre>"
            rescue
                ENV[key]
            end
    res << "<tr><td><strong>#{key}</strong></td><td>#{value}</tr>"
  end
  res << "</table></div>"
  res << "<h2>HTTP Request Headers</h2>"
  res << "<div><table>"
  env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}.sort.each do |k,v|
    res << "<tr><td><strong>#{k}</strong></td><td>#{v}</tr>"
  end
  res << "</table></div></body></html>"
end

get '/some-error' do
  $stderr.puts "This is an error log"
end
