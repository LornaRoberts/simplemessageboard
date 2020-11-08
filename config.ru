require_relative "./app"
set :database, ENV['DATABASE_URL'] || 'postgres://bgjkcvuwvvcwgl:5072876651dae60aacdfd0df563f495fcdd95be1856c5beee8688e77f7948edb@ec2-54-247-103-43.eu-west-1.compute.amazonaws.com:5432/d1gb2q6vdcsd1k
'

run Chitter
