class Mutations::CreateBook < Mutations::BaseMutation
    argument :name, String, required: true
    argument :author_id, Integer, required: true
  
    field :book, Types::BookType, null: false
    field :errors, [String], null: false
  
    def resolve(name:, author_id:)
      book = Book.new(name: name, author_id: author_id)
      if book.save
        # Successful creation, return the created object with no errors
        {
          book: book,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          book: nil,
          errors: book.errors.full_messages
        }
      end
    end
  end
  