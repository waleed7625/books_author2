module Mutations

class Mutations::DestroyBook < Mutations::BaseMutation

        argument :id, Integer, required: true
  
        field :book, Types::BookType, null: false 
  
        def resolve(id:)
         book = Book.find(id)
         book.destroy!
          {book: book}
        end
      end
    end

    #   module Mutations
    #     class DestroyBook < GraphQL::Schema::RelayClassicMutation
    #       # TODO: define return fields
    #       # field :post, Types::PostType, null: false
    #       field :book, Types::BookType, null: false
    #       # TODO: define arguments
    #       # argument :name, String, required: true
    #       argument :id, ID, required: true
    #       # TODO: define resolve method
    #       # def resolve(name:)
    #       #   { post: ... }
    #       # end
    #       def resolve(id:)
    #         book = Book.find(id)
    #         book.destroy!
    #         { book: book }
    #       end
    #     end
    #   end
      