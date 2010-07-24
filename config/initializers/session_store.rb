# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iAppsForStudents_session',
  :secret      => 'b499595e9c39915421cf3bc888a8a0d35d10350a11f8aadaa93dd0f6464666df47aff4bc7e8f39e3f050c339ff009454d712577ec5e25149bc1fd692ebdab2b1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
