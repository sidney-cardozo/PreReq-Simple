class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
    end

    create_table :employers do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.text :description
      t.string :image
      t.timestamps null: false
    end

    create_table :applicants do |t|
      t.belongs_to :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :description
      t.string :resume_link
      t.string :image
      t.text :fields, array: true, default: []
      t.boolean :paired , default: false
      t.timestamps null: false
    end

    create_table :jobs do |t|
      t.belongs_to :employer, index: true
      t.string :position
      t.text :description
      t.text :requirements
      t.string :job_type
      t.text :apply_info
      t.timestamps null: false
    end

    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image
      t.string :concentration
      t.string :industry
      t.string :resume_link
      t.boolean :paired , default: false
      t.timestamps null: false
    end

    create_table :pairs do |t|
      t.belongs_to :applicant, index: true
      t.belongs_to :student, index: true
      t.text :story
      t.boolean :story_on_display, default: false
      t.timestamps null: false
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :job_tags do |t|
      t.belongs_to :job, index: true
      t.belongs_to :tag, index: true
    end
  end

  def down
    drop_table :users
    drop_table :employers
    drop_table :applicants
    drop_table :jobs
    drop_table :students
    drop_table :pairs
    drop_table :tags
    drop_table :job_tags
  end
end
