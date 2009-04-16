class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string   "login"
      t.string   "email"
      t.string   "crypted_password",          :limit => 40
      t.string   "salt",                      :limit => 40
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "remember_token"
      t.datetime "remember_token_expires_at"
      t.boolean  "admin",                                   :default => false
      t.datetime "last_login_at"
      t.text     "bio_html"
      t.string   "bio"
      t.string   "display_name"
      t.string   "permalink"
      t.string   "password_reset_code"
    end
    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
