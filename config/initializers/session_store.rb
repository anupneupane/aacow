# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aacow_session',
  :secret      => 'c41b653121a34855b2e5c4f03ad033f5982d3ddaa4b5b29785f77d52ccfec3fdb70219bf9228880d03f6ff3213f5bdd66f72e5764af0000348a9e043d69d383f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
