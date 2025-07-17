class CreateSupportRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :support_requests do |t|
      t.string :email, comment: "Email of the submitter"
      t.string :subject, comment: "Subject of their support email"
      t.text :body, comment: "Body of their support email"
      t.references :order,
                    foreign_key: true,
                    comment: "their most recent order, if applicable"
      t.timestamps
    end
  end
end

#foreign_key: true înseamnă că Rails va crea o relație între support_requests și orders, 
#astfel încât fiecare support_request.order_id trebuie să corespundă unui orders.id, 
#asigurând integritatea referinței între cele două tabele