class Mutations::CreateAuthor < Mutations::BaseMutation
        argument :first_name, String, required: true
        argument :last_name, String, required: true



     
        # field :errors,  [String], null: false
        field :author, Types::AuthorType, null: false
    
        def resolve(first_name:, last_name:)
        author = Author.new(first_name: first_name, last_name: last_name)
        if author.save
            {
                author: author,
                
            }
        else{
            author: nil,
        
        }
        end
end
end