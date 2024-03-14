class CreateTagAnnotations < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_annotations do |t|
      t.belongs_to :annotation, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
