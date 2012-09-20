require 'json'
require 'sequel'

Sequel.datetime_class = DateTime

DB = Sequel.connect ENV['DATABASE_URL'] || 'postgres://localhost/pager_rage'

DB.create_table :incidents do
  primary_key :id
  Integer     :incident_number
  DateTime    :pagerduty_created_on
  String      :service_name
  String      :subject
  Text        :data
end unless DB.table_exists?(:incidents)

module PagerRage
end

require 'pager_rage/incident'
require 'pager_rage/incidents_parser'
require 'pager_rage/version'
