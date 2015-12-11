class CreateCompanygoers < ActiveRecord::Migration
  def change
    create_table :companygoers do |t|

      t.timestamps null: false
    end
  end
end
