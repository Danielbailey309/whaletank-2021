class AddCostToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :cost, :integer
  end
end
