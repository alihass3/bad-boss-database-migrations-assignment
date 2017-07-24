class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :manufacturer
      t.decimal :cost
    end

    reversible do |dir|
        dir.up do
          # add a CHECK constraint
          execute <<-SQL
            ALTER TABLE parts
              ADD CONSTRAINT zipchk
                CHECK (char_length(zipcode) = 5) NO INHERIT;
          SQL
        end
        dir.down do
          execute <<-SQL
            ALTER TABLE parts
              DROP CONSTRAINT zipchk
          SQL
        end
      end

  end
end
