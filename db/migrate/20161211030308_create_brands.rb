class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.string	:name, null: false, uniqueness: true
    	
      t.timestamps null: false
    end
  end
end
