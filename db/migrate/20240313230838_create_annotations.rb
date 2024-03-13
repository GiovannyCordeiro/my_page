class CreateAnnotations < ActiveRecord::Migration[7.1]
  def change
    create_table :annotations do |t|
      t.string :title
      t.string :description
      t.string :content

      t.timestamps
    end
  end
end
