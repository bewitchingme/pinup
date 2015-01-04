require 'ext/hash'

EVENTS_CONFIG = YAML.load_file("#{Rails.root}/config/events.yml")[Rails.env].to_dotted_hash