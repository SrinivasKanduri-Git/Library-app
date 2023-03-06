class AuthorTest < ActiveSupport::TestCase
    test "Author should be valid" do
        @author = Author.new(author: "srinivas")
        assert @author.valid?
    end
end