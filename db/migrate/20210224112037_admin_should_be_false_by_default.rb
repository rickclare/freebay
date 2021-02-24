class AdminShouldBeFalseByDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :admin, from: true, to: false
  end
end