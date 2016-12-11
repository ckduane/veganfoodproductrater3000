class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer	:brand_id, null: false
    	t.string	:name, null: false
    	
      t.timestamps null: false
    end
  end
end
