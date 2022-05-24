class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :title,null:false,blank:false,required:true;
      t.text :description,null:false,blank:false,required:true,minimum: 0, maximum:200;
      t.timestamps
    end
  end
end
