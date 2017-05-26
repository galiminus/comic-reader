class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.references :comic
      t.string :s3_file_url
      t.timestamps
    end
  end
end
