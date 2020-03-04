class ErrorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :errors

  attribute :errors do |user|
    user.errors.full_messages.to_sentence
  end
end
