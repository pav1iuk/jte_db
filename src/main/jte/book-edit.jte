@import com.example.demo.Book
@import com.example.demo.Author
@import java.util.List
@param Book book
@param List<Author> authors

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="form-container">
    <h2>Edit Book</h2>
    <form action="/books/edit/${book.id}" method="post">
        <input type="text" name="title" value="${book.title}" required>
        <select name="authorId" required>
            @for(Author author : authors)
                <option value="${author.id}" selected="@{author.id == book.author?.id}">
                    ${author.name}
                </option>

            @endfor
        </select>
        <button type="submit">Update</button>
    </form>
    <div class="link">
        <a href="/books">Back to List</a>
    </div>
</div>
</body>
</html>
