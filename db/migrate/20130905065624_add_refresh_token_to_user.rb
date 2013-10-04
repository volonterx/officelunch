class AddRefreshTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :refresh_google_token, :string
  end
end
