class AddActiveToAnnotations < ActiveRecord::Migration[7.1]
  def change
    add_column :annotations, :active, :boolean, default: true
    change_column_default :annotations, :active, true
  end
end
