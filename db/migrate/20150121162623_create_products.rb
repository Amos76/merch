class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

    	t.string 	:name
    	t.text	 	:description
    	
    	t.integer :price_in_pence

      t.timestamps null: false
    end
  end
end
