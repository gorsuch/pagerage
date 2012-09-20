require 'sequel'

DB = Sequel.connect ENV['DATABASE_URL'] || 'postgres://localhost/pager_rage'

DB.create_table :incidents do
  primary_key :id
  Text :data
end unless DB.table_exists?(:incidents)

module PagerRage
end

require 'pager_rage/version'
require 'pager_rage/incident'
