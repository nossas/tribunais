class CreateOrganizations < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
      CREATE FOREIGN TABLE organizations(id integer NOT NULL)
      SERVER meurio_accounts
      OPTIONS (table_name 'organizations');
      SQL
    else
      create_table :organizations do |t|
        t.timestamps
      end
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
      DROP FOREIGN TABLE organizations
      SQL
    else
      drop_table :organizations
    end
  end
end
