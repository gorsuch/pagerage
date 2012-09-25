require 'json'
require 'rest_client'
require 'sequel'
require 'time'

require 'pagerage/config'

Sequel.datetime_class = DateTime

DB = Sequel.connect Pagerage::Config.database_url

DB.create_table :incidents do
  primary_key :id
  Integer     :incident_number
  DateTime    :pagerduty_created_on
  String      :service_name
  String      :subject
  Text        :data
end unless DB.table_exists?(:incidents)

require 'pagerage/incident'
require 'pagerage/incidents_fetcher'
require 'pagerage/incidents_parser'
require 'pagerage/incidentinator'
require 'pagerage/version'
