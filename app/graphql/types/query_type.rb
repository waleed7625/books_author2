module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
    description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
    
    field :books, [Types::BookType], null: false 
    def books
      Book.all
    end


    field :book, Types::BookType, null: false do
      argument :id, ID, required: true
    end

    def book(id:)
      Book.find(id)
    end
    

    field :authors, [Types::AuthorType], null: false
    
    def authors
Author.all
    end
  

    field :author, Types::AuthorType, null: false do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.find(id)
    end
  end
end
